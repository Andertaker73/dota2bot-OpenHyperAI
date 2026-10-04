#!/bin/bash
# verify-env.sh — confere se o ambiente de dev está pronto
# Uso: bash scripts/verify-env.sh
set -u

# Diretório raiz do repo (assume que este script vive em scripts/)
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

FAIL=0
ok()   { echo "  ✅ $1"; }
fail() { echo "  ❌ $1"; FAIL=$((FAIL+1)); }
warn() { echo "  ⚠️  $1"; }

echo "== 1. Node e npm =="
if command -v node >/dev/null 2>&1; then
    NODE_V="$(node --version)"
    NODE_MAJOR="${NODE_V#v}"; NODE_MAJOR="${NODE_MAJOR%%.*}"
    if [ "$NODE_MAJOR" -ge 20 ]; then ok "node $NODE_V"; else fail "node $NODE_V (esperado >= 20)"; fi
else
    fail "node não encontrado"
fi

if command -v npm >/dev/null 2>&1; then
    NPM_V="$(npm --version)"
    NPM_MAJOR="${NPM_V%%.*}"
    if [ "$NPM_MAJOR" -ge 10 ]; then ok "npm $NPM_V"; else warn "npm $NPM_V (recomendado >= 10)"; fi
else
    fail "npm não encontrado"
fi

echo "== 2. Estrutura do repositório =="
[ -d "$REPO_ROOT/typescript/bots" ] && ok "typescript/bots/ existe" || fail "typescript/bots/ ausente"
[ -f "$REPO_ROOT/tsconfig-tstl.json" ] && ok "tsconfig-tstl.json presente" || fail "tsconfig-tstl.json ausente"
[ -f "$REPO_ROOT/package.json" ] && ok "package.json presente" || fail "package.json ausente"
[ -d "$REPO_ROOT/bots" ] && ok "bots/ (destino dos .lua) existe" || fail "bots/ ausente"

echo "== 3. Dependências instaladas =="
[ -d "$REPO_ROOT/node_modules" ] && ok "node_modules/ existe" || fail "rode: npm install"

for pkg in typescript typescript-to-lua; do
    if [ -d "$REPO_ROOT/node_modules/$pkg" ]; then
        V="$(node -p "require('$REPO_ROOT/node_modules/$pkg/package.json').version" 2>/dev/null || echo '?')"
        ok "$pkg@$V"
    else
        fail "$pkg não instalado"
    fi
done

echo "== 4. Versão do TypeScript casa com o peer do tstl =="
TS_V="$(npx --no-install tsc --version 2>/dev/null | awk '{print $2}')"
if [ -n "$TS_V" ]; then
    ok "tsc $TS_V"
    # tstl 1.26.x exige exatamente 5.5.2
    case "$TS_V" in
        5.5.2) ok "compatível com typescript-to-lua" ;;
        5.5.*) warn "tsc $TS_V — funciona, mas o peer oficial é 5.5.2" ;;
        *)     warn "tsc $TS_V — fora do range do peer; pode falhar em updates" ;;
    esac
else
    fail "npx tsc não respondeu"
fi

echo "== 5. package.json: script build =="
if grep -q '"build:lua"' package.json; then
    LINE="$(grep '"build:lua"' package.json)"
    ok "$LINE"
    case "$LINE" in
        *";"*post-process*) ok "usa ';' (post-process roda mesmo se tstl falhar)" ;;
        *"&&"*post-process*) warn "usa '&&' — build silenciosamente para em erros TS" ;;
    esac
else
    fail "script build:lua ausente"
fi

echo "== 6. Build de ponta a ponta =="
LOG="$(mktemp)"
if npm run build >"$LOG" 2>&1; then
    ok "npm run build completou"
else
    fail "npm run build retornou erro — ver $LOG"
fi

if grep -qE '^.*error TS' "$LOG"; then
    echo "  Erros TS encontrados:"
    grep -E '^.*error TS' "$LOG" | sed 's/^/    /'
    FAIL=$((FAIL+1))
else
    ok "sem erros TS"
fi

if grep -q "Transforming require path" "$LOG"; then
    N="$(grep -c "Transforming require path" "$LOG")"
    ok "post-process rodou ($N transformações)"
else
    fail "post-process não rodou — ver $LOG"
fi

echo "== 7. Artefatos gerados =="
for f in bots/FunLib/aba_defend.lua bots/FunLib/aba_push.lua bots/FunLib/utils.lua; do
    if [ -s "$REPO_ROOT/$f" ]; then
        LINES="$(wc -l < "$REPO_ROOT/$f")"
        ok "$f ($LINES linhas)"
    else
        fail "$f ausente ou vazio"
    fi
done

echo "== 8. Git =="
if command -v git >/dev/null 2>&1; then
    ok "git $(git --version | awk '{print $3}')"
    if [ -d "$REPO_ROOT/.git" ]; then
        REMOTE="$(git -C "$REPO_ROOT" remote get-url origin 2>/dev/null || echo '(sem origin)')"
        ok "origin = $REMOTE"
        BRANCH="$(git -C "$REPO_ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null || echo '?')"
        ok "branch atual = $BRANCH"
        UNPUSHED="$(git -C "$REPO_ROOT" log --oneline origin/$BRANCH..$BRANCH 2>/dev/null | wc -l)"
        if [ "$UNPUSHED" -gt 0 ]; then
            warn "$UNPUSHED commit(s) local(is) não pushado(s)"
        else
            ok "sem commits pendentes de push"
        fi
    fi
else
    fail "git não encontrado"
fi

echo ""
if [ "$FAIL" -eq 0 ]; then
    echo "✅ Ambiente pronto para desenvolvimento."
else
    echo "❌ $FAIL verificação(ões) falharam. Veja acima."
    exit 1
fi
