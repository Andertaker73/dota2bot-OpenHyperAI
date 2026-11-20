--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end
-- End of Lua Library inline imports
local ____exports = {}
local IsValidUnit
local jmz = require(GetScriptDirectory().."/FunLib/jmz_func")
local ____dota = require(GetScriptDirectory().."/ts_libs/dota/index")
local Tower = ____dota.Tower
function IsValidUnit(unit)
    if not unit then
        return false
    end
    if not jmz.IsValid(unit) then
        return false
    end
    if not unit:IsAlive() then
        return false
    end
    return true
end
local nTeam = GetTeam()
____exports.BaseThreatLevel = BaseThreatLevel or ({})
____exports.BaseThreatLevel.None = 0
____exports.BaseThreatLevel[____exports.BaseThreatLevel.None] = "None"
____exports.BaseThreatLevel.Outer = 1
____exports.BaseThreatLevel[____exports.BaseThreatLevel.Outer] = "Outer"
____exports.BaseThreatLevel.Inner = 2
____exports.BaseThreatLevel[____exports.BaseThreatLevel.Inner] = "Inner"
____exports.BaseThreatLevel.Ancient = 3
____exports.BaseThreatLevel[____exports.BaseThreatLevel.Ancient] = "Ancient"
--- Nível agregado de ameaça à base da equipe.
function ____exports.GetBaseThreatLevel()
    local team = GetTeam()
    local ancient = GetAncient(team)
    if ancient ~= nil then
        if jmz.Utils.CountEnemyHeroesNear(
            ancient:GetLocation(),
            2600
        ) >= 1 then
            return ____exports.BaseThreatLevel.Ancient
        end
        if ancient:GetHealth() < ancient:GetMaxHealth() then
            local enemiesNearAncient = jmz.GetEnemiesNearLoc(
                ancient:GetLocation(),
                800
            )
            local creepCount = 0
            for ____, unit in ipairs(enemiesNearAncient) do
                if unit:IsCreep() or unit:IsAncientCreep() or unit:HasModifier("modifier_dominated") then
                    creepCount = creepCount + 1
                end
            end
            if creepCount >= 3 then
                print("[OHA DEBUG] Ancient sob ataque de creeps! Contagem: " .. tostring(creepCount))
                return ____exports.BaseThreatLevel.Ancient
            end
        end
    end
    if jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1 then
        return ____exports.BaseThreatLevel.Ancient
    end
    local t3s = {
        GetTower(team, Tower.Top3),
        GetTower(team, Tower.Mid3),
        GetTower(team, Tower.Bot3)
    }
    for ____, t3 in ipairs(t3s) do
        if t3 and jmz.IsValidBuilding(t3) then
            if jmz.Utils.CountEnemyHeroesNear(
                t3:GetLocation(),
                1800
            ) >= 1 then
                return ____exports.BaseThreatLevel.Inner
            end
        end
    end
    return ____exports.BaseThreatLevel.None
end
--- Retorna true se o time está em uma corrida pela base e vai vencer antes de perder a sua.
function ____exports.IsWinningBaseRace()
    local team = GetTeam()
    local enemyTeam = GetOpposingTeam()
    local ourAncient = GetAncient(team)
    local enemyAncient = GetAncient(enemyTeam)
    if not ourAncient or not enemyAncient then
        return false
    end
    if ourAncient:GetHealth() >= ourAncient:GetMaxHealth() then
        return false
    end
    local alliesAtEnemy = jmz.GetAlliesNearLoc(
        enemyAncient:GetLocation(),
        1600
    )
    local enemiesAtOur = jmz.GetEnemiesNearLoc(
        ourAncient:GetLocation(),
        1600
    )
    if #alliesAtEnemy < 3 then
        return false
    end
    if #alliesAtEnemy <= #enemiesAtOur then
        return false
    end
    if enemyAncient:GetHealth() >= enemyAncient:GetMaxHealth() then
        return false
    end
    local ourHpPct = ourAncient:GetHealth() / ourAncient:GetMaxHealth()
    local enemyHpPct = enemyAncient:GetHealth() / enemyAncient:GetMaxHealth()
    return enemyHpPct < ourHpPct
end
--- Quantos bots devem recuar para defender, dado o nível de ameaça.
function ____exports.GetDesignatedResponders(threatLevel, threatBuilding)
    if threatLevel <= 1 then
        return {}
    end
    if threatLevel >= 3 and ____exports.IsWinningBaseRace() then
        return {}
    end
    local building = threatBuilding ~= nil and threatBuilding or GetAncient(nTeam)
    if building == nil then
        return {}
    end
    local loc = building:GetLocation()
    if threatLevel >= 3 then
        local all = {}
        do
            local i = 1
            while i <= 5 do
                local m = GetTeamMember(i)
                if m and m:IsAlive() then
                    all[#all + 1] = m:GetPlayerID()
                end
                i = i + 1
            end
        end
        return all
    end
    local cands = {}
    do
        local i = 1
        while i <= 5 do
            do
                local __continue28
                repeat
                    local m = GetTeamMember(i)
                    if not m or not m:IsAlive() then
                        __continue28 = true
                        break
                    end
                    local pos = jmz.GetPosition(m)
                    if pos == 1 then
                        __continue28 = true
                        break
                    end
                    local tp = jmz.GetItem2(m, "item_tpscroll")
                    cands[#cands + 1] = {
                        pid = m:GetPlayerID(),
                        pos = pos,
                        dist = GetUnitToLocationDistance(m, loc),
                        hasTp = jmz.CanCastAbility(tp)
                    }
                    __continue28 = true
                until true
                if not __continue28 then
                    break
                end
            end
            i = i + 1
        end
    end
    if #cands == 0 then
        local p1 = GetTeamMember(1)
        return p1 and p1:IsAlive() and ({p1:GetPlayerID()}) or ({})
    end
    local posOrder = {3, 2, 4, 5}
    __TS__ArraySort(
        cands,
        function(____, a, b)
            local pa = __TS__ArrayIndexOf(posOrder, a.pos)
            local pb = __TS__ArrayIndexOf(posOrder, b.pos)
            if pa ~= pb then
                return pa - pb
            end
            if a.hasTp ~= b.hasTp then
                return a.hasTp and -1 or 1
            end
            return a.dist - b.dist
        end
    )
    local result = {cands[1].pid}
    if cands[1].dist > 5000 and not cands[1].hasTp and #cands > 1 then
        result[#result + 1] = cands[2].pid
    end
    return result
end
--- True se a localização ameaçada está próxima da base.
function ____exports.IsEnemyThreatNearOurBase(_building, _radius)
    local team = nTeam
    local ancient = GetAncient(team)
    if ancient and IsValidUnit(ancient) then
        if jmz.Utils.CountEnemyHeroesNear(
            ancient:GetLocation(),
            2600
        ) >= 1 then
            return true
        end
    end
    if jmz.Utils.CountEnemyHeroesOnHighGround(team) >= 1 then
        return true
    end
    return false
end
return ____exports
