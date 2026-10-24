local Utils = require( GetScriptDirectory()..'/FunLib/utils')
local J = require( GetScriptDirectory()..'/FunLib/jmz_func')

local Version      = require(GetScriptDirectory()..'/FunLib/version')
local Localization = require(GetScriptDirectory()..'/FunLib/localization')


local bot = GetBot()
local botName = bot:GetUnitName()
if bot == nil or bot:IsInvulnerable() or not bot:IsHero() or not bot:IsAlive() or not string.find(botName, "hero") or bot:IsIllusion() then return end

local local_mode_laning_generic = nil
local nAllyCreeps = nil
local nEnemyCreeps = nil
local nFurthestEnemyAttackRange = 0
local nInRangeEnemy = nil
local botAssignedLane = nil
local botAttackRange = bot:GetAttackRange()
local attackDamage = bot:GetAttackDamage()
local nH, enemyBots = J.Utils.NumHumanBotPlayersInTeam(GetOpposingTeam())
local teamHumans, teamBots = J.Utils.NumHumanBotPlayersInTeam(GetTeam())

-- Announcer state
local hasPickedOneAnnouncer      = false
local lastAnnouncePrintedTime    = 0
local numberAnnouncePrinted      = 1
local announcementGapSeconds     = 6
local isChangePosMessageDone     = false

if Utils.BuggyHeroesDueToValveTooLazy[botName] then local_mode_laning_generic = dofile( GetScriptDirectory().."/FunLib/override_generic/mode_laning_generic" ) end

function GetDesire()
	PickOneAnnouncer()
	AnnounceMessages()

	if bot:IsInvulnerable() or not bot:IsHero() or not bot:IsAlive() or not string.find(botName, "hero") or bot:IsIllusion() then return BOT_MODE_DESIRE_NONE end
	local botLV = bot:GetLevel()
	local currentTime = DotaTime()

	botAttackRange = bot:GetAttackRange()
	nAllyCreeps = bot:GetNearbyLaneCreeps(1200, false)
	nEnemyCreeps = bot:GetNearbyLaneCreeps(800, true)
	nInRangeEnemy = bot:GetNearbyHeroes(1600, true, BOT_MODE_NONE)
	nFurthestEnemyAttackRange = GetFurthestEnemyAttackRange(nInRangeEnemy)
	if local_mode_laning_generic then
		botAssignedLane = local_mode_laning_generic.GetBotTargetLane()
	else
		botAssignedLane = bot:GetAssignedLane()
	end
	attackDamage = bot:GetAttackDamage()
	if bot:GetItemSlotType(bot:FindItemSlot("item_quelling_blade")) == ITEM_SLOT_TYPE_MAIN then
		if bot:GetAttackRange() > 310 or bot:GetUnitName() == "npc_dota_hero_templar_assassin" then
			attackDamage = attackDamage + 4
		else
			attackDamage = attackDamage + 8
		end
	end

	if GetGameMode() == 23 then currentTime = currentTime * 1.65 end
	if currentTime < 0 then return BOT_ACTION_DESIRE_NONE end

	-- if DotaTime() > 20 and DotaTime() - skipLaningState.lastCheckTime < skipLaningState.checkGap then
	-- 	if skipLaningState.count > 6 then
	-- 		print('[WARN] Bot ' ..botName.. ' switching modes too often, now stop it for laning to avoid conflicts.')
	-- 		return 0
	-- 	end
	-- else
	-- 	skipLaningState.lastCheckTime = DotaTime()
	-- 	skipLaningState.count = 0
	-- end

	if J.GetEnemiesAroundAncient(bot, 3200) > 0 then
		return BOT_MODE_DESIRE_NONE
	end

	-- if J.GetDistanceFromAncient( bot, true ) < 6900 then
	-- 	return BOT_MODE_DESIRE_NONE
	-- end

	if bot:WasRecentlyDamagedByAnyHero(5)
	and #J.Utils.GetLastSeenEnemyIdsNearLocation(bot:GetLocation(), 800) > 0 then
		local nLaneFrontLocation = GetLaneFrontLocation(GetTeam(), bot:GetAssignedLane(), 0)
		local nDistFromLane = GetUnitToLocationDistance(bot, nLaneFrontLocation)
		if not J.WeAreStronger(bot, 1200) or (nDistFromLane > 700 and J.GetHP(bot) < 0.7) then
			return BOT_MODE_DESIRE_NONE
		end
	end

	-- 如果在打高地 就别撤退去干别的
	if J.Utils.IsTeamPushingSecondTierOrHighGround(bot) then
		return BOT_MODE_DESIRE_NONE
	end
	-- if J.ShouldGoFarmDuringLaning(bot) then
	-- 	return 0.2
	-- end

	if local_mode_laning_generic or (J.GetPosition(bot) == 1 and J.IsPosxHuman(5)) then
		-- last hit
		if J.IsInLaningPhase() then
			local hitCreep, _ = GetBestLastHitCreep(nEnemyCreeps)
			if J.IsValid(hitCreep) then
				if J.GetPosition(bot) <= 2 or not J.IsThereNonSelfCoreNearby(700) -- this is for e.g lone druid bear as pos1-2 with core LD nearby to do last hit.
				then
					return 0.9
				end
			end
		end
	end
	if local_mode_laning_generic and local_mode_laning_generic.GetDesire ~= nil then return local_mode_laning_generic.GetDesire() end

	if GetGameMode() == GAMEMODE_1V1MID or GetGameMode() == GAMEMODE_MO then
		return 1
	end

	if currentTime <= 10 then return 0.268 end
	if currentTime <= 9 * 60 and botLV <= 7 then return 0.446 end
	if currentTime <= 12 * 60 and botLV <= 11 then return 0.369 end
	if botLV <= 14 and J.GetCoresAverageNetworth() < 7000 then return 0.2 end

	J.Utils.GameStates.passiveLaningTime = true
	return 0.01
end

function GetFurthestEnemyAttackRange(enemyList)
	local attackRange = 0
	for _, enemy in pairs(enemyList) do
		if J.IsValidHero(enemy) and not J.IsSuspiciousIllusion(enemy) then
			local enemyAttackRange = enemy:GetAttackRange()
			if enemyAttackRange > attackRange then
				attackRange = enemyAttackRange
			end
		end
	end

	return attackRange
end

function GetBestLastHitCreep(hCreepList)
        local bestCreep = nil
        local bestDist = math.huge
        local moveToCreep = nil
        local moveToDist = math.huge

        for _, creep in pairs(hCreepList) do
                if J.IsValid(creep) and J.CanBeAttacked(creep) then
                        local nDelay = J.GetAttackProDelayTime(bot, creep)
                        local nDist = GetUnitToUnitDistance(bot, creep)
                        local creepHP = creep:GetHealth()

                        -- 1. Podemos matar AGORA com um ataque? (Dano exato)
                        if J.WillKillTarget(creep, attackDamage, DAMAGE_TYPE_PHYSICAL, nDelay) then
                                if nDist < bestDist then
                                        bestDist = nDist
                                        bestCreep = creep
                                end
                        -- 2. Podemos matar em breve? (Dano + um pouco de margem, mas seguro)
                        -- Só nos movemos se o creep estiver num raio seguro (ex: botAttackRange + 300)
                        elseif creepHP <= (attackDamage * 1.3) and nDist <= botAttackRange + 300 then
                                if nDist < moveToDist then
                                        moveToDist = nDist
                                        moveToCreep = creep
                                end
                        end
                end
        end

        if bestCreep then
                return bestCreep, false -- Atacar imediatamente
        end
        if moveToCreep then
                return moveToCreep, true -- Mover para o creep
        end
        return nil, false
end

function GetBestDenyCreep(hCreepList)
	-- Deny must be prioritized even without enemy heroes nearby. A deny is a lane-saving action,
	-- not a reaction only to enemy pressure.
	local bestCreep = nil
	local bestDist = math.huge
	local bestMoveToCreep = nil
	local bestMoveToDist = math.huge
	for _, creep in pairs(hCreepList)
	do
		if not J.IsValid(creep) or not J.CanBeAttacked(creep) then
			goto continue
		end
		if not string.find(creep:GetUnitName(), 'npc_dota_creep_') then
			goto continue
		end

		local nDist = GetUnitToUnitDistance(bot, creep)
		local nDelay = J.GetAttackProDelayTime(bot, creep)
		local hpPct = J.GetHP(creep)
		if hpPct < 0.49 then
			if J.WillKillTarget(creep, attackDamage, DAMAGE_TYPE_PHYSICAL, nDelay) then
				if nDist < bestDist then
					bestDist = nDist
					bestCreep = creep
				end
			elseif nDist < bestMoveToDist then
				bestMoveToDist = nDist
				bestMoveToCreep = creep
			end
		elseif hpPct < 0.7 and nDist < bestMoveToDist then
			bestMoveToDist = nDist
			bestMoveToCreep = creep
		end
		::continue::
	end

	return bestCreep, bestMoveToCreep
end

-- =====================================================================
-- Seleciona o melhor alvo de harass (herói inimigo) na lane.
-- Retorna nil se nenhuma troca vale a pena.
--
-- Regras de pontuação (quanto maior, melhor):
--   +3   alvo com HP < 40%
--   +3   alvo com HP < 25% (cumulativo — finisher vale muito)
--   +1   bot tem mais HP que o alvo (troca favorável)
--   +2   vantagem numérica local (mais aliados que inimigos em 700)
--   +1   números iguais e bot com HP > 50% (troca "neutra" aceitável)
--   +1.5 alvo é jogador humano (o usuário reportou que humanos têm muito espaço)
--
-- Rejeições:
--   - Suspeita de ilusão, invulnerável, magic immune
--   - Modifiers que anulam kill: Borrowed Time, Shallow Grave, Reaper's Scythe,
--     False Promise
--   - Distância > botAttackRange + 200
--   - Bot com HP < 35% e em desvantagem numérica local (evita trade suicida)
-- =====================================================================
function GetBestHarassTarget(nEnemyList, nRange)
        if nEnemyList == nil then return nil end

        local bestTarget = nil
        local bestScore = 0

        local botHP = bot:GetHealth() / bot:GetMaxHealth()
        local nAllyNearby = J.GetAlliesNearLoc(bot:GetLocation(), 700)
        local nEnemyNearby = J.GetEnemiesNearLoc(bot:GetLocation(), 700)

        for _, enemy in pairs(nEnemyList) do
                local bValid = J.IsValidHero(enemy)
                        and not J.IsSuspiciousIllusion(enemy)
                        and not enemy:IsInvulnerable()
                        and not enemy:IsMagicImmune()
                        and not enemy:HasModifier('modifier_abaddon_borrowed_time')
                        and not enemy:HasModifier('modifier_dazzle_shallow_grave')
                        and not enemy:HasModifier('modifier_necrolyte_reapers_scythe')
                        and not enemy:HasModifier('modifier_oracle_false_promise_timer')
                        and GetUnitToUnitDistance(bot, enemy) <= nRange + 200

                if bValid then
                        local enemyHP = enemy:GetHealth() / enemy:GetMaxHealth()
                        local score = 0

                        if enemyHP < 0.4 then score = score + 3 end
                        if enemyHP < 0.25 then score = score + 3 end
                        if botHP > enemyHP + 0.15 then score = score + 1 end
                        if #nAllyNearby > #nEnemyNearby then score = score + 2 end
                        if #nAllyNearby == #nEnemyNearby and botHP > 0.5 then score = score + 1 end
                        if not enemy:IsBot() then score = score + 1.5 end

                        local bTooWeak = botHP < 0.35 and #nAllyNearby <= #nEnemyNearby

                        if not bTooWeak and score > bestScore then
                                bestScore = score
                                bestTarget = enemy
                        end
                end
        end

        -- Sem nenhum motivo (nem HP baixo, nem vantagem), não vale trocar CS
        -- por um hit de harass ruim. Score mínimo 1.
        if bestScore < 1 then return nil end

        return bestTarget
end

function Think()
        -- =====================================================================
        -- ORDEM DE PRIORIDADE DO LANE (após esta mudança):
        --   1. Negar creep aliado (deny)          — do commit f3c52aa
        --   2. Último hit (last hit)               — ouro garantido
        --   3. Atacar herói inimigo (harass)      — NOVO: restaura agressão na lane
        --   4. Farmar neutros próximos             — anti-idle
        --   5. Ir para a frente da lane            — posicionamento
        --
        -- Regressão corrigida: após f3c52aa e db89678, o modo laning perdeu
        -- completamente a fase de ataque a herói. Como laning é o modo ativo
        -- durante toda a fase de rotas (desire ~0.45-0.9), os bots nunca
        -- contestavam humanos visíveis na lane — o oponente farmava livre.
        -- =====================================================================

        local denyCreep, denyMoveToCreep = GetBestDenyCreep(nAllyCreeps)
        if J.IsValid(denyCreep) then
                if GetUnitToUnitDistance(bot, denyCreep) > botAttackRange then
                        bot:Action_MoveToUnit(denyCreep)
                        return
                end
                bot:SetTarget(denyCreep)
                bot:Action_AttackUnit(denyCreep, true)
                return
        elseif J.IsValid(denyMoveToCreep) and GetUnitToUnitDistance(bot, denyMoveToCreep) > botAttackRange * 0.6 then
                bot:Action_MoveToUnit(denyMoveToCreep)
                return
        end

        local hitCreep, moveToCreep = GetBestLastHitCreep(nEnemyCreeps)
        if J.IsValid(hitCreep) then
                -- Ceder last hit a humano aliado na mesma lane (comportamento existente)
                local bHumanLaneAllyNearby = false
                for _, ally in ipairs(GetUnitList(UNIT_LIST_ALLIED_HEROES)) do
                        if J.IsValidHero(ally) and not ally:IsBot()
                                and ally:GetAssignedLane() == botAssignedLane
                                and GetUnitToUnitDistance(bot, ally) <= 700 then
                                bHumanLaneAllyNearby = true
                                break
                        end
                end

                if not bHumanLaneAllyNearby then
                        local dist = GetUnitToUnitDistance(bot, hitCreep)
                        -- OHA MOD: Não perseguir creep se estiver muito longe (anti-freeze e anti-feed)
                        if dist <= botAttackRange + 300 then
                                if dist > botAttackRange or (moveToCreep and dist > botAttackRange * 0.8) then
                                        bot:Action_MoveToUnit(hitCreep)
                                        return
                                else
                                        bot:SetTarget(hitCreep)
                                        bot:Action_AttackUnit(hitCreep, true)
                                        return
                                end
                        end
                end
        end

        -- =====================================================================
        -- NOVO: atacar herói inimigo na lane
        -- Só chega aqui se não há deny nem last hit pendente — priorizamos CS
        -- primeiro. Depois, se houver herói em alcance, ataca.
        -- =====================================================================
        local harassTarget = GetBestHarassTarget(nInRangeEnemy, botAttackRange)
        if J.IsValidHero(harassTarget) then
                local dist = GetUnitToUnitDistance(bot, harassTarget)
                if dist > botAttackRange then
                        -- Fora de alcance: só avança se estiver perto. Não perseguir
                        -- muito — perderia last hits e levaria aggro de creeps.
                        if dist <= botAttackRange + 200 then
                                bot:Action_MoveToUnit(harassTarget)
                                return
                        end
                else
                        bot:SetTarget(harassTarget)
                        bot:Action_AttackUnit(harassTarget, true)
                        return
                end
        end

        -- Anti-idle: atacar neutros próximos (comportamento existente)
        local nNeutrals = bot:GetNearbyNeutralCreeps(800)
        local bHumanFarmingHere = false
        for _, ally2 in ipairs(GetUnitList(UNIT_LIST_ALLIED_HEROES)) do
                if J.IsValidHero(ally2) and not ally2:IsBot()
                        and #nNeutrals > 0
                        and GetUnitToUnitDistance(ally2, nNeutrals[1]) <= 700 then
                        bHumanFarmingHere = true
                        break
                end
        end
        if not bHumanFarmingHere and #nNeutrals > 0 then
                bot:SetTarget(nNeutrals[1])
                bot:Action_AttackUnit(nNeutrals[1], true)
                return
        end

        if local_mode_laning_generic then
                local_mode_laning_generic.Think()
        end

        local fLaneFrontAmount = GetLaneFrontAmount(GetTeam(), botAssignedLane, false)
        local fLaneFrontAmount_enemy = GetLaneFrontAmount(GetOpposingTeam(), botAssignedLane, false)

        local nLongestAttackRange = math.max(botAttackRange, 250, nFurthestEnemyAttackRange)

        local target_loc = GetLaneFrontLocation(GetTeam(), botAssignedLane, -nLongestAttackRange)
        if fLaneFrontAmount_enemy < fLaneFrontAmount then
                target_loc = GetLaneFrontLocation(GetOpposingTeam(), botAssignedLane, -nLongestAttackRange)
        end

        bot:Action_MoveToLocation(target_loc + RandomVector(50))
end


function PickOneAnnouncer()
	if not hasPickedOneAnnouncer then
		for i, _ in pairs(GetTeamPlayers(GetTeam())) do
			local member = GetTeamMember(i)
			if member ~= nil and member.isAnnouncer then return end
		end
		bot.isAnnouncer = true
		hasPickedOneAnnouncer = true
	end
end

function AnnounceMessages()
	-- Only pre-game chatter
	if DotaTime() > 60 then return end

	local welcomeMessages = Localization.Get('welcome_msgs')
	local inTurbo         = J.IsModeTurbo()

	-- Staggered lines during negative DotaTime pre-game
	if ((inTurbo and DotaTime() > -50 + GetTeam() * 2) or (not inTurbo and DotaTime() > -75 + GetTeam() * 2))
	   and numberAnnouncePrinted < #welcomeMessages + 1
	   and bot.isAnnouncer
	   and DotaTime() < 0
	then
		if GameTime() - lastAnnouncePrintedTime >= announcementGapSeconds then
			local message      = welcomeMessages[numberAnnouncePrinted]
			local isFirstLine  = (numberAnnouncePrinted == 1)
			if message then
				-- Match original behavior: first line (or if no enemy bots) can be global
				bot:ActionImmediate_Chat(isFirstLine and (message .. Version.number) or message, enemyBots == 0 or isFirstLine)
			end
			numberAnnouncePrinted   = numberAnnouncePrinted + 1
			lastAnnouncePrintedTime = GameTime()
		end
	end

	-- Announce role during pre-game
	if GetGameMode() ~= GAMEMODE_1V1MID
	   and GetGameState() == GAME_STATE_PRE_GAME
	   and (bot.announcedRole == nil or bot.announcedRole ~= J.GetPosition(bot))
	then
		bot.announcedRole = J.GetPosition(bot)
		bot:ActionImmediate_Chat(Localization.Get('say_play_pos') .. J.GetPosition(bot), false)
	end

	-- Close position selection after horn if humans and bots mixed
	if GetGameMode() ~= GAMEMODE_1V1MID and not isChangePosMessageDone then
		if DotaTime() >= 0 and teamHumans > 0 and teamBots > 0 then
			bot:ActionImmediate_Chat(Localization.Get('pos_select_closed'), true)
			isChangePosMessageDone = true
		end
	end
end
