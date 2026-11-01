-- bots/FunLib/hero_init.lua
local HeroInit = {}

function HeroInit.GetTalentBuildList( nLocalList )
    local sTargetList = {}
    for i = 1, #nLocalList do
        local rawTalent = nLocalList[i] == 'l' and 10 or 0
        if rawTalent == 10 then
            sTargetList[#sTargetList + 1] = i * 2
        else
            sTargetList[#sTargetList + 1] = i * 2 - 1
        end
    end
    for i = 1, #nLocalList do
        local rawTalent = nLocalList[i] == 'r' and 10 or 0
        if rawTalent ~= 10 then
            sTargetList[#sTargetList + 1] = i * 2
        else
            sTargetList[#sTargetList + 1] = i * 2 - 1
        end
    end
    return sTargetList
end

function HeroInit.SetUserHeroInit( nAbilityBuildList, nTalentBuildList, sBuyList, sSellList )
    local bot = GetBot()
    local botName = bot:GetUnitName()
    local sBotDir, tBotSet = "game/Customize/hero/" .. string.gsub(botName, "npc_dota_hero_", ""), nil
    local status, _ = xpcall(function() tBotSet = require( sBotDir ) end, function( err ) print( '[WARN] When loading customized game file: '..err ) end )
    if not (status and tBotSet) then
        sBotDir = GetScriptDirectory() .. "/Customize/hero/" .. string.gsub(botName, "npc_dota_hero_", "")
        status, _ = xpcall(function() tBotSet = require( sBotDir ) end, function( err ) print( '[WARN] When loading customized file: '..err ) end )
    end
    if status and tBotSet and tBotSet.Enable then
        nAbilityBuildList = tBotSet.AbilityUpgrade
        nTalentBuildList = HeroInit.GetTalentBuildList( tBotSet.Talent ) -- Chamada interna corrigida
        sBuyList = tBotSet.PurchaseList
        sSellList = tBotSet.SellList
    end
    return nAbilityBuildList, nTalentBuildList, sBuyList, sSellList
end

return HeroInit