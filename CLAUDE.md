# CLAUDE.md — AI Assistant Guidelines for OpenHyperAI

Welcome, AI Assistant! This file is your primary entry point for maintaining the OpenHyperAI codebase. Read this before making any changes.

## 1. Critical: TypeScript vs. Pure Lua

This project is a hybrid. You must know which file to edit.

* **TypeScript Files (`typescript/bots/...`)**:
  * Files like `aba_defend.ts`, `aba_push.ts`, `utils.ts` are written in TS.
  * DO NOT EDIT their generated `.lua` counterparts directly (e.g., `bots/FunLib/aba_defend.lua`).
  * After editing a `.ts` file, you MUST run `npm run build` to generate the `.lua` files.
  * Warnings like `TS6133` (unused variable) will fail the build. Clean them up immediately.

* **Pure Lua Files (`bots/...`)**:
  * Files like `bots/mode_laning_generic.lua`, `bots/FunLib/jmz_func.lua`, `bots/BotLib/*.lua`.
  * These do NOT have TS counterparts. Edit the `.lua` file directly.
  * They do NOT require `npm run build`. They are picked up directly by the game engine.

## 2. Mandatory Validation Before Commit

Never commit without validating syntax. The Dota 2 engine will silently fail or crash if a Lua file is malformed.

If you edited TypeScript:
`npm run build`
`grep -E "error TS" /tmp/build.log` (Output MUST be empty)

Validate the generated or edited .lua files (using Lua 5.1):
`luac5.1 -p bots/FunLib/aba_defend.lua && echo "OK"`

## 3. Triage Guide (Symptom -> File)

If you are asked to fix a specific behavior, look here first. Do not guess. Read the corresponding doc in `docs/behavior/`.

| Symptom | Primary File(s) | Read this Doc |
|---|---|---|
| Bots freeze / give first blood in lane | `jmz_func.lua`, `mode_laning_generic.lua` | `docs/behavior/01-laning.md`, `docs/behavior/05-action-gates.md` |
| All bots abandon push to defend base | `aba_defend.ts`, `aba_push.ts` | `docs/behavior/03-defense.md` |
| Bots ignore base threat / Ancient falls | `aba_defend.ts` | `docs/behavior/03-defense.md` |
| Bots miss last hits / denies | `mode_laning_generic.lua` | `docs/behavior/01-laning.md` |
| Bots not roaming or missing ganks | `mode_roam_generic.lua`, `mode_team_roam_generic.lua` | `docs/behavior/04-roam.md` |
| Bots don't follow hero pick order | `hero_selection.lua`, `general.lua` | `ARCHITECTURE.md` (Sec 10) |

## 4. Behavior Documentation

All rules regarding bot decision-making (Desires, Trade-offs, Gates) are documented in the `docs/behavior/` folder. If you change a Desire threshold or an Action Gate, you must update the corresponding doc.