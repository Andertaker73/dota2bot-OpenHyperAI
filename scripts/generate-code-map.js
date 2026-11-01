#!/usr/bin/env node
/**
 * generate-code-map.js
 * Gera docs/code-map.md e docs/code-map.json a partir da AST real
 * dos arquivos TS (via ts-morph) e Lua 5.1 (via luaparse).
 *
 * Uso: node scripts/generate-code-map.js
 */
const fs   = require('fs');
const path = require('path');
const { Project } = require('ts-morph');
const luaparse    = require('luaparse');

const ROOT     = path.resolve(__dirname, '..');
const OUT_MD   = path.join(ROOT, 'docs', 'code-map.md');
const OUT_JSON = path.join(ROOT, 'docs', 'code-map.json');

const TS_FILES = [
  'typescript/bots/FunLib/aba_defend.ts',
  'typescript/bots/FunLib/aba_push.ts',
  'typescript/bots/FunLib/global_cache.ts',
];
const LUA_FILES = ['bots/FunLib/jmz_func.lua'];

const botsDir = path.join(ROOT, 'bots');
if (fs.existsSync(botsDir)) {
  for (const f of fs.readdirSync(botsDir)) {
    if (/^mode_.*\.lua$/.test(f)) LUA_FILES.push(`bots/${f}`);
  }
}

const entries = [];

// ---------- TypeScript (ts-morph) ----------
function analyzeTS(relPath) {
  const abs = path.join(ROOT, relPath);
  if (!fs.existsSync(abs)) { console.warn(`skip TS (não existe): ${relPath}`); return; }
  const project = new Project({ skipFileDependencyResolution: true });
  const sf = project.addSourceFileAtPath(abs);
  for (const fn of sf.getFunctions()) {
    entries.push({
      file: relPath, lang: 'ts',
      name: fn.getName(),
      params: fn.getParameters()
        .map(p => p.getName() + (p.getTypeNode() ? ': ' + p.getTypeNode().getText() : ''))
        .join(', '),
      returns: fn.getReturnTypeNode()?.getText() ?? (fn.getReturnType()?.getText() || ''),
      line: fn.getStartLineNumber(),
      exported: fn.isExported(),
    });
  }
}

// ---------- Lua 5.1 (luaparse) ----------
function analyzeLua(relPath) {
  const abs = path.join(ROOT, relPath);
  if (!fs.existsSync(abs)) { console.warn(`skip Lua (não existe): ${relPath}`); return; }
  const src = fs.readFileSync(abs, 'utf8');
  let ast; try { ast = luaparse.parse(src, { locations: true, luaVersion: '5.1' }); }
  catch (e) { console.warn(`parse Lua falhou (${relPath}): ${e.message}`); return; }
  walkLua(ast, relPath);
}

function walkLua(node, relPath) {
  if (!node || typeof node !== 'object') return;
  if (node.type === 'FunctionDeclaration' && node.identifier) {
    const name = memberName(node.identifier);
    entries.push({ file: relPath, lang: 'lua', name,
      params:  (node.parameters || []).map(p => p.name).join(', '),
      returns: '', line: node.loc.start.line,
      exported: /^J\./.test(name) });
  }
  if (node.type === 'AssignmentStatement') {
    for (let i = 0; i < (node.variables || []).length; i++) {
      const init = node.init && node.init[i];
      if (init?.type === 'FunctionDeclaration') {
        const name = memberName(node.variables[i]);
        entries.push({ file: relPath, lang: 'lua', name,
          params:  (init.parameters || []).map(p => p.name).join(', '),
          returns: '', line: node.loc.start.line,
          exported: /^J\./.test(name) });
      }
    }
  }
  for (const k of Object.keys(node)) {
    if (k === 'loc' || k === 'range') continue;
    const v = node[k];
    if (Array.isArray(v)) v.forEach(c => walkLua(c, relPath));
    else if (v?.type) walkLua(v, relPath);
  }
}

function memberName(n) {
  if (!n) return '<anon>';
  if (n.type === 'MemberExpression') return `${memberName(n.base)}.${n.identifier?.name ?? ''}`;
  if (n.type === 'Identifier') return n.name;
  if (n.type === 'StringLiteral') return n.value;
  return '<anon>';
}

// ---------- callers ----------
function findCallers(name) {
  const short = name.includes('.') ? name.split('.').pop() : name;
  if (!short || short === '<anon>') return [];
  const re = new RegExp(`\\b${short}\\s*\\(`);
  const hits = [];
  (function walk(dir) {
    for (const f of fs.readdirSync(dir, { withFileTypes: true })) {
      const p = path.join(dir, f.name);
      if (f.isDirectory()) { if (!['node_modules','.git','dist','docs'].includes(f.name)) walk(p); continue; }
      if (!/\.(ts|lua)$/.test(f.name)) continue;
      if (re.test(fs.readFileSync(p, 'utf8'))) hits.push(path.relative(ROOT, p));
    }
  })(ROOT);
  return [...new Set(hits)].sort();
}

// ---------- run ----------
TS_FILES.forEach(analyzeTS);
LUA_FILES.forEach(analyzeLua);
for (const e of entries) e.callers = findCallers(e.name);

fs.mkdirSync(path.dirname(OUT_JSON), { recursive: true });
fs.writeFileSync(OUT_JSON, JSON.stringify(entries, null, 2));

const out = ['# Code Map — OpenHyperAI', '',
  '> Gerado automaticamente por `scripts/generate-code-map.js`. Não edite manualmente.', ''];
const byFile = entries.reduce((a, e) => ((a[e.file] ||= []).push(e), a), {});
for (const file of Object.keys(byFile).sort()) {
  out.push(`## \`${file}\``, '',
    '| Função | Parâmetros | Retorno | Exportada | Chamada por | Linha |',
    '|---|---|---|---|---|---|');
  for (const e of byFile[file].sort((a, b) => a.line - b.line)) {
    const callers = (e.callers || []).filter(c => c !== e.file).slice(0, 5).join('<br>') || '—';
    out.push(`| \`${e.name}\` | ${(e.params || '—').replace(/\|/g,'\\|')} | ${e.returns || '—'} | ${e.exported ? 'sim' : 'não'} | ${callers} | ${e.line} |`);
  }
  out.push('');
}
fs.writeFileSync(OUT_MD, out.join('\n'));
console.log(`✔ ${OUT_MD}\n✔ ${OUT_JSON}\n  ${entries.length} símbolos em ${Object.keys(byFile).length} arquivos.`);