-- bots/FunLib/action_gates.lua
local ActionGates = {}

function ActionGates.HasQueuedAction( bot )
    if bot ~= nil and bot == GetBot() then
        return bot:NumQueuedActions() > 0
    end
    return false
end

function ActionGates.IsTryingtoUseAbility(bot)
    return bot:IsCastingAbility()
    or bot:IsUsingAbility()
    or bot:IsChanneling()
end

--[[
ActionGates.MustReactNow(bot)
--]]
function ActionGates.MustReactNow(bot)
    if bot == nil or not bot:IsAlive() then return false end
    if bot:IsInvulnerable() then return false end

    -- Não interromper canalização ou cast deliberado
    if bot:IsChanneling() or bot:IsCastingAbility() then return false end

    -- (1) Grace period pós-TP
    local hasTp = bot:HasModifier("modifier_teleporting")
    if hasTp then
        bot._wasTeleporting = true
    elseif bot._wasTeleporting then
        bot._wasTeleporting = false
        bot._tpGraceUntil = DotaTime() + 0.5
    end
    if bot._tpGraceUntil ~= nil and DotaTime() < bot._tpGraceUntil then
        return true
    end

    -- (2) Dano recente de herói
    if bot:WasRecentlyDamagedByAnyHero(1.5) then return true end

    -- (3) HP crítico + inimigo próximo (Substituído J.GetHP)
    local hp = bot:GetHealth() / bot:GetMaxHealth()
    if hp < 0.30 then
        local enemies = bot:GetNearbyHeroes(900, true, BOT_MODE_NONE)
        if enemies ~= nil and #enemies > 0 then return true end
    end

    -- (4) DoTs perigosos
    if bot:HasModifier("modifier_jakiro_macropyre") then return true end
    if bot:HasModifier("modifier_jakiro_macropyre_burn") then return true end
    if bot:HasModifier("modifier_jakiro_dual_breath_dot") and hp < 0.5 then return true end
    if bot:HasModifier("modifier_viper_poison_attack") and hp < 0.35 then return true end
    if bot:HasModifier("modifier_venomancer_venomous_gale") and hp < 0.35 then return true end

    -- (5) Avoidance zones (Macropyre, áreas de dano persistente)
    if GetAvoidanceZones ~= nil then
        local zones = GetAvoidanceZones()
        if zones ~= nil then
            for _, z in pairs(zones) do
                if z.location ~= nil then
                    local dist = (bot:GetLocation() - z.location):Length()
                    if dist <= (z.radius or 300) then
                        return true
                    end
                end
            end
        end
    end

    return false
end

function ActionGates.CanNotUseAction( bot )
    if ActionGates.MustReactNow(bot) then return false end

    return not bot:IsAlive()
                    or ActionGates.HasQueuedAction( bot )
                    or (bot:IsInvulnerable() and not bot:HasModifier("modifier_dark_willow_shadow_realm_buff"))
                    or bot:IsCastingAbility()
                    or bot:IsUsingAbility()
                    or bot:IsChanneling()
end

function ActionGates.IsBotBusyChannelingOrStunned( bot )
    return not bot:IsAlive()
                    or (bot:IsInvulnerable() and not bot:HasModifier('modifier_fountain_invulnerability') and not bot:HasModifier('modifier_dazzle_nothl_projection_soul_debuff'))
                    or bot:IsCastingAbility()
                    or bot:IsUsingAbility()
                    or bot:IsChanneling()
                    or (bot:IsStunned() and not bot:HasModifier('modifier_dazzle_nothl_projection_soul_debuff'))
                    or bot:IsNightmared()
                    or bot:HasModifier( 'modifier_ringmaster_the_box_buff' )
                    or bot:HasModifier( 'modifier_item_forcestaff_active' )
                    or bot:HasModifier( 'modifier_phantom_lancer_phantom_edge_boost' )
                    or bot:HasModifier( 'modifier_tinker_rearm' )
end

function ActionGates.CanNotUseAbility( bot )
    return not bot:IsAlive()
                    or ActionGates.HasQueuedAction( bot )
                    or (bot:IsInvulnerable() and not bot:HasModifier('modifier_fountain_invulnerability') and not bot:HasModifier('modifier_dazzle_nothl_projection_soul_debuff'))
                    or bot:IsCastingAbility()
                    or bot:IsUsingAbility()
                    or bot:IsChanneling()
                    or bot:IsSilenced()
                    or (bot:IsStunned() and not bot:HasModifier('modifier_dazzle_nothl_projection_soul_debuff'))
                    or bot:IsHexed()
                    or bot:IsNightmared()
                    or bot:HasModifier( 'modifier_ringmaster_the_box_buff' )
                    or bot:HasModifier( "modifier_doom_bringer_doom" )
                    or bot:HasModifier( 'modifier_item_forcestaff_active' )
end

return ActionGates