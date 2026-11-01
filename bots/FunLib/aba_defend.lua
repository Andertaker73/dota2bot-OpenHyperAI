--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
-- Lua Library inline imports
local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

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

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        if debug == nil then
            return nil
        end
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (description .. "\n") .. tostring(self.stack)
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_1 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if metatable and not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        return self.message ~= "" and (self.name .. ": ") .. self.message or self.name
    end
    Error = ____initErrorClass_1(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_3 = initErrorClass
        local ____class_2 = __TS__Class()
        ____class_2.name = ____class_2.name
        __TS__ClassExtends(____class_2, Error)
        function ____class_2.prototype.____constructor(self, ...)
            ____class_2.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_3(nil, ____class_2, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end
-- End of Lua Library inline imports
local ____exports = {}
local getDefendState, _q, _keyLoc, _recentHeroCountNear, IsValidBuildingTarget, IsBaseThreatActive, WeightedEnemiesAroundLocation, GetThreatenedLane, GetClosestAllyPos, IsThereNoTeammateTravelBootsDefender, ConsiderPingedDefend, okLoc, Localization, Customize, PING_DELTA, MAX_DESIRE_CAP, BASE_THREAT_RADIUS, BASE_THREAT_HOLD, CACHE_ENEMY_AROUND_LOC_HZ, CACHE_LASTSEEN_WINDOW, nTeam, _threatLaneSticky, baseThreatUntil, fTraveBootsDefendTime, _cacheEnemyAroundLoc
local jmz = require(GetScriptDirectory().."/FunLib/jmz_func")
local ____dota = require(GetScriptDirectory().."/ts_libs/dota/index")
local Barracks = ____dota.Barracks
local BotActionDesire = ____dota.BotActionDesire
local BotMode = ____dota.BotMode
local BotModeDesire = ____dota.BotModeDesire
local Lane = ____dota.Lane
local Tower = ____dota.Tower
local ____native_2Doperators = require(GetScriptDirectory().."/ts_libs/utils/native-operators")
local add = ____native_2Doperators.add
local ____utils = require(GetScriptDirectory().."/FunLib/utils")
local GetLocationToLocationDistance = ____utils.GetLocationToLocationDistance
local ____responder_policy = require(GetScriptDirectory().."/FunLib/responder_policy")
local BaseThreatLevel = ____responder_policy.BaseThreatLevel
local GetBaseThreatLevel = ____responder_policy.GetBaseThreatLevel
local GetDesignatedResponders = ____responder_policy.GetDesignatedResponders
local IsEnemyThreatNearOurBase = ____responder_policy.IsEnemyThreatNearOurBase
local ____global_cache = require(GetScriptDirectory().."/FunLib/global_cache")
local getGlobalGameState = ____global_cache.getGlobalGameState
local getGlobalLocationState = ____global_cache.getGlobalLocationState
local getGlobalUnitState = ____global_cache.getGlobalUnitState
local GetHighGroundEdgeWaitPoint = ____global_cache.GetHighGroundEdgeWaitPoint
function getDefendState(bot)
    if not bot._defend then
        bot._defend = {
            defendLoc = GetLaneFrontLocation(nTeam, Lane.Mid, 0),
            weAreStronger = false,
            nInRangeAlly = {},
            nInRangeEnemy = {},
            distanceToLane = {[Lane.Top] = 0, [Lane.Mid] = 0, [Lane.Bot] = 0}
        }
    end
    return bot._defend
end
function _q(v)
    return v and (tostring(math.floor(v.x / 200) * 200) .. ":") .. tostring(math.floor(v.y / 200) * 200) or "0:0"
end
function _keyLoc(v, r)
    return (_q(v) .. "|") .. tostring(math.floor(r or 0))
end
function _recentHeroCountNear(loc, r, window)
    if window == nil then
        window = CACHE_LASTSEEN_WINDOW
    end
    local gameState = getGlobalGameState()
    local cnt = 0
    for ____, id in ipairs(GetTeamPlayers(gameState.enemyTeam)) do
        do
            local __continue9
            repeat
                if not IsHeroAlive(id) then
                    __continue9 = true
                    break
                end
                local info = GetHeroLastSeenInfo(id)
                if info and info[1] and info[1].time_since_seen <= window and GetLocationToLocationDistance(info[1].location, loc) <= r then
                    cnt = cnt + 1
                end
                __continue9 = true
            until true
            if not __continue9 then
                break
            end
        end
    end
    return cnt
end
function IsValidBuildingTarget(unit)
    return unit ~= nil and unit:IsAlive() and unit:IsBuilding()
end
function IsBaseThreatActive()
    return DotaTime() < (baseThreatUntil or -1)
end
function WeightedEnemiesAroundLocation(vLoc, nRadius)
    local now = DotaTime()
    local key = _keyLoc(vLoc, nRadius)
    local c = _cacheEnemyAroundLoc[key]
    if c and now - c.t <= CACHE_ENEMY_AROUND_LOC_HZ then
        return c.count
    end
    local unitState = getGlobalUnitState()
    local count = 0
    for ____, unit in ipairs(unitState.enemies) do
        if jmz.IsValid(unit) and GetUnitToLocationDistance(unit, vLoc) <= nRadius then
            local name = unit:GetUnitName()
            if jmz.IsValidHero(unit) and not jmz.IsSuspiciousIllusion(unit) then
                count = count + (jmz.IsCore(unit) and 1 or 0.5)
            elseif ({string.find(name, "upgraded_mega")}) ~= nil then
                count = count + 0.6
            elseif ({string.find(name, "upgraded")}) ~= nil then
                count = count + 0.4
            elseif ({string.find(name, "siege")}) ~= nil and ({string.find(name, "upgraded")}) == nil then
                count = count + 0.5
            elseif ({string.find(name, "warlock_golem")}) ~= nil or ({string.find(name, "lone_druid_bear")}) ~= nil then
                count = count + 1
            elseif unit:IsCreep() or unit:IsAncientCreep() or unit:IsDominated() or unit:HasModifier("modifier_chen_holy_persuasion") or unit:HasModifier("modifier_dominated") then
                count = count + 0.2
            end
        end
    end
    count = math.floor(count)
    _cacheEnemyAroundLoc[key] = {t = now, count = count}
    return count
end
--- Detecta qual lane um jogador humano do time está sinalizando como prioritária.
-- Retorna a Lane correspondente, ou null se não há sinal claro.
-- 
-- Exportada porque também é usada em aba_push.ts.
-- 
-- Fontes (por ordem de prioridade):
--   1. Humano já está em modo de defesa de uma lane (DefendTowerTop/Mid/Bot)
--   2. Humano deu um ping recente próximo a uma torre de lane
function ____exports.GetHumanLanePressureLane()
    local teamSize = #GetTeamPlayers(nTeam)
    do
        local i = 1
        while i <= teamSize do
            do
                local __continue27
                repeat
                    local member = GetTeamMember(i)
                    if not member or not jmz.IsValidHero(member) then
                        __continue27 = true
                        break
                    end
                    local pid = member:GetPlayerID()
                    if pid < 0 or IsPlayerBot(pid) then
                        __continue27 = true
                        break
                    end
                    if not IsHeroAlive(pid) then
                        __continue27 = true
                        break
                    end
                    local mode = member:GetActiveMode()
                    if mode == BotMode.DefendTowerTop then
                        return Lane.Top
                    end
                    if mode == BotMode.DefendTowerMid then
                        return Lane.Mid
                    end
                    if mode == BotMode.DefendTowerBot then
                        return Lane.Bot
                    end
                    __continue27 = true
                until true
                if not __continue27 then
                    break
                end
            end
            i = i + 1
        end
    end
    local human, humanPing = jmz.GetHumanPing()
    if human and humanPing and DotaTime() > 0 and GameTime() < humanPing.time + 8 then
        local isPinged, pingedLane = jmz.IsPingCloseToValidTower(nTeam, humanPing, 1200, 8)
        if isPinged then
            return pingedLane
        end
    end
    return nil
end
function GetThreatenedLane()
    local lanes = {Lane.Top, Lane.Mid, Lane.Bot}
    local bestLane = lanes[1]
    local bestScore = -1
    local ancient = GetAncient(nTeam)
    for ____, ln in ipairs(lanes) do
        local bld, _urgent, tier = unpack(____exports.GetFurthestBuildingOnLane(ln))
        local anchor = IsValidBuildingTarget(bld) and tier < 3 and bld:GetLocation() or GetHighGroundEdgeWaitPoint(nTeam, ln)
        local enemyHeroCnt = _recentHeroCountNear(anchor, 1800)
        local score = enemyHeroCnt * 10
        local hgEdge = GetHighGroundEdgeWaitPoint(nTeam, ln)
        local enemiesAtHGBuilding = jmz.GetLastSeenEnemiesNearLoc(hgEdge, 2000)
        local enemiesAtBase = ancient ~= nil and jmz.GetLastSeenEnemiesNearLoc(
            ancient:GetLocation(),
            2600
        ) or ({})
        local barracksForLane = ln == Lane.Top and ({
            GetBarracks(nTeam, Barracks.TopMelee),
            GetBarracks(nTeam, Barracks.TopRanged)
        }) or (ln == Lane.Mid and ({
            GetBarracks(nTeam, Barracks.MidMelee),
            GetBarracks(nTeam, Barracks.MidRanged)
        }) or ({
            GetBarracks(nTeam, Barracks.BotMelee),
            GetBarracks(nTeam, Barracks.BotRanged)
        }))
        local enemiesAtBarracks = __TS__ArrayReduce(
            barracksForLane,
            function(____, acc, b) return acc + (b and #jmz.GetLastSeenEnemiesNearLoc(
                b:GetLocation(),
                1800
            ) or 0) end,
            0
        )
        local ____temp_3
        if ln == Lane.Top then
            ____temp_3 = GetTower(nTeam, Tower.Top3)
        else
            local ____temp_2
            if ln == Lane.Mid then
                ____temp_2 = GetTower(nTeam, Tower.Mid3)
            else
                ____temp_2 = GetTower(nTeam, Tower.Bot3)
            end
            ____temp_3 = ____temp_2
        end
        local t3 = ____temp_3
        local enemiesAtT3 = t3 and IsValidBuildingTarget(t3) and #jmz.GetLastSeenEnemiesNearLoc(
            t3:GetLocation(),
            1800
        ) or 0
        local threatCount = #enemiesAtHGBuilding + #enemiesAtBase + enemiesAtBarracks + enemiesAtT3
        if threatCount >= 1 then
            score = 999 + threatCount
        end
        if enemyHeroCnt == 0 then
            local creepEq = math.min(
                WeightedEnemiesAroundLocation(anchor, 1200) * 0.4,
                0.9
            )
            score = score + creepEq
        end
        if ln == Lane.Mid and threatCount == 0 then
            score = score * 1.2
        end
        if score > bestScore then
            bestScore = score
            bestLane = ln
        end
    end
    if DotaTime() <= _threatLaneSticky["until"] then
        return _threatLaneSticky.lane
    end
    _threatLaneSticky = {
        lane = bestLane,
        ["until"] = DotaTime() + 1.8
    }
    return bestLane
end
function GetClosestAllyPos(tPosList, vLocation)
    local bestPos = nil
    local bestDist = math.huge
    do
        local i = 1
        while i <= 5 do
            local m = GetTeamMember(i)
            if jmz.IsValidHero(m) then
                local p = jmz.GetPosition(m)
                do
                    local j = 1
                    while j <= #tPosList do
                        if p == tPosList[j + 1] then
                            local d = GetUnitToLocationDistance(m, vLocation)
                            if d < bestDist then
                                bestDist = d
                                bestPos = p
                            end
                        end
                        j = j + 1
                    end
                end
            end
            i = i + 1
        end
    end
    return bestPos or tPosList[1]
end
function ____exports.GetFurthestBuildingOnLane(lane)
    local cacheKey = (("FurthestBuildingOnLane:" .. tostring(nTeam)) .. ":") .. tostring(lane or -1)
    local cachedVar = jmz.Utils.GetCachedVars(cacheKey, 1)
    if cachedVar ~= nil then
        return cachedVar
    end
    local res = ____exports.GetFurthestBuildingOnLaneHelper(lane)
    jmz.Utils.SetCachedVars(cacheKey, res)
    return res
end
function ____exports.GetFurthestBuildingOnLaneHelper(lane)
    local team = nTeam
    local b
    local function hpMul(u, lo, hi, mlo, mhi)
        local nHealth = u:GetHealth() / u:GetMaxHealth()
        return RemapValClamped(
            nHealth,
            lo,
            hi,
            mlo,
            mhi
        )
    end
    if lane == Lane.Top then
        b = GetTower(team, Tower.Top1)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    0.5,
                    1
                ),
                1
            }
        end
        b = GetTower(team, Tower.Top2)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    1,
                    2
                ),
                2
            }
        end
        b = GetTower(team, Tower.Top3)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    1.5,
                    2
                ),
                3
            }
        end
        b = GetBarracks(team, Barracks.TopMelee)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetBarracks(team, Barracks.TopRanged)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetTower(team, Tower.Base1)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetTower(team, Tower.Base2)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetAncient(team)
        if IsValidBuildingTarget(b) then
            return {b, 3, 4}
        end
    elseif lane == Lane.Mid then
        b = GetTower(team, Tower.Mid1)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    0.5,
                    1
                ),
                1
            }
        end
        b = GetTower(team, Tower.Mid2)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    1,
                    2
                ),
                2
            }
        end
        b = GetTower(team, Tower.Mid3)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    1.5,
                    2
                ),
                3
            }
        end
        b = GetBarracks(team, Barracks.MidMelee)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetBarracks(team, Barracks.MidRanged)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetTower(team, Tower.Base1)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetTower(team, Tower.Base2)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetAncient(team)
        if IsValidBuildingTarget(b) then
            return {b, 3, 4}
        end
    else
        b = GetTower(team, Tower.Bot1)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    0.5,
                    1
                ),
                1
            }
        end
        b = GetTower(team, Tower.Bot2)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    1,
                    2
                ),
                2
            }
        end
        b = GetTower(team, Tower.Bot3)
        if IsValidBuildingTarget(b) then
            return {
                b,
                hpMul(
                    b,
                    0.25,
                    1,
                    1.5,
                    2
                ),
                3
            }
        end
        b = GetBarracks(team, Barracks.BotMelee)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetBarracks(team, Barracks.BotRanged)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetTower(team, Tower.Base1)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetTower(team, Tower.Base2)
        if IsValidBuildingTarget(b) then
            return {b, 2.5, 3}
        end
        b = GetAncient(team)
        if IsValidBuildingTarget(b) then
            return {b, 3, 4}
        end
    end
    return {nil, 1, 0}
end
function IsThereNoTeammateTravelBootsDefender(bot)
    local unitState = getGlobalUnitState()
    for ____, m in ipairs(unitState.teamMembers) do
        if bot ~= m and jmz.IsValidHero(m) and m.travel_boots_defender == true then
            return false
        end
    end
    return true
end
function ____exports.ShouldDefend(bot, hBuilding, nRadius)
    if not IsValidBuildingTarget(hBuilding) then
        return false
    end
    local gameState = getGlobalGameState()
    local enemyHeroNearby = 0
    for ____, id in ipairs(GetTeamPlayers(gameState.enemyTeam)) do
        if IsHeroAlive(id) then
            local info = GetHeroLastSeenInfo(id)
            if info ~= nil then
                local d = info[1]
                if d ~= nil and d.time_since_seen <= CACHE_LASTSEEN_WINDOW and GetUnitToLocationDistance(hBuilding, d.location) <= 1600 then
                    enemyHeroNearby = enemyHeroNearby + 1
                end
            end
        end
    end
    local unitState = getGlobalUnitState()
    local creepWeights = 0
    for ____, unit in ipairs(unitState.enemyCreeps) do
        if jmz.IsValid(unit) and GetUnitToUnitDistance(hBuilding, unit) <= nRadius then
            local name = unit:GetUnitName()
            if ({string.find(name, "siege")}) ~= nil and ({string.find(name, "upgraded")}) == nil then
                creepWeights = creepWeights + 0.5
            elseif ({string.find(name, "upgraded_mega")}) ~= nil then
                creepWeights = creepWeights + 0.6
            elseif ({string.find(name, "upgraded")}) ~= nil then
                creepWeights = creepWeights + 0.4
            elseif ({string.find(name, "warlock_golem")}) ~= nil or ({string.find(name, "shadow_shaman_ward")}) ~= nil then
                creepWeights = creepWeights + 1
            elseif ({string.find(name, "lone_druid_bear")}) ~= nil then
                enemyHeroNearby = enemyHeroNearby + 1
            elseif unit:IsCreep() or unit:IsAncientCreep() or unit:IsDominated() or unit:HasModifier("modifier_chen_holy_persuasion") or unit:HasModifier("modifier_dominated") then
                creepWeights = creepWeights + 0.2
            end
        end
    end
    local nNearby = enemyHeroNearby + math.floor(creepWeights)
    local pos = jmz.GetPosition(bot)
    local threatLevel = GetBaseThreatLevel()
    if threatLevel >= 2 then
        local responders = GetDesignatedResponders(threatLevel, hBuilding)
        if __TS__ArrayIndexOf(
            responders,
            bot:GetPlayerID()
        ) ~= -1 then
            return true
        end
        if #responders > 0 then
            return false
        end
    end
    local result = false
    if nNearby == 1 then
        if pos == 2 or pos == GetClosestAllyPos(
            {4, 5},
            hBuilding:GetLocation()
        ) then
            result = true
        end
    elseif nNearby == 2 then
        if pos == 2 or pos == 3 or pos == GetClosestAllyPos(
            {4, 5},
            hBuilding:GetLocation()
        ) or pos == 1 and GetUnitToUnitDistance(bot, hBuilding) <= 3200 then
            result = true
        end
    elseif nNearby == 3 then
        if pos == 2 or pos == 3 or pos == 4 or pos == 5 or pos == 1 and GetUnitToUnitDistance(bot, hBuilding) <= 3200 then
            result = true
        end
    elseif nNearby >= 4 then
        result = true
    end
    if not result then
        if DotaTime() - fTraveBootsDefendTime >= 20 then
            bot.travel_boots_defender = false
        end
        if bot:GetUnitName() == "npc_dota_hero_tinker" and bot:GetLevel() >= 6 and jmz.CanCastAbility(bot:GetAbilityByName("tinker_keen_teleport")) and IsThereNoTeammateTravelBootsDefender(bot) then
            bot.travel_boots_defender = true
            fTraveBootsDefendTime = DotaTime()
            result = true
        else
            local boots = jmz.GetItem2(bot, "item_travel_boots") or jmz.GetItem2(bot, "item_travel_boots_2")
            if jmz.CanCastAbility(boots) and IsThereNoTeammateTravelBootsDefender(bot) then
                bot.travel_boots_defender = true
                fTraveBootsDefendTime = DotaTime()
                result = true
            end
        end
        if not result and pos == GetClosestAllyPos(
            {2, 3},
            hBuilding:GetLocation()
        ) then
            result = true
        end
    end
    local underFire = bot:WasRecentlyDamagedByAnyHero(5)
    if underFire and result then
        local closestPos = GetClosestAllyPos(
            {2, 3, 4, 5},
            hBuilding:GetLocation()
        )
        if jmz.GetPosition(bot) ~= closestPos then
            return false
        end
    end
    return result
end
function ConsiderPingedDefend(bot, lane, desire, building, tier, nEffAllies, nEnemies)
    local gameState = getGlobalGameState()
    if gameState.isLaningPhase or gameState.aliveAllyCount == 0 then
        return
    end
    if not IsValidBuildingTarget(building) then
        return
    end
    local baseThreatLevel = GetBaseThreatLevel()
    local isBaseThreat = baseThreatLevel >= 2
    if not isBaseThreat then
        if tier < 2 or desire <= 0.5 then
            return
        end
        if not ____exports.ShouldDefend(bot, building, 1600) then
            return
        end
    end
    jmz.Utils.GameStates = jmz.Utils.GameStates or ({})
    jmz.Utils.GameStates.defendPings = jmz.Utils.GameStates.defendPings or ({pingedTime = GameTime()})
    local defendPings = jmz.Utils.GameStates.defendPings
    local ____isBaseThreat_4
    if isBaseThreat then
        ____isBaseThreat_4 = nEffAllies >= nEnemies + 2
    else
        ____isBaseThreat_4 = nEffAllies >= nEnemies
    end
    local haveNumbers = ____isBaseThreat_4
    if nEffAllies >= 1 and haveNumbers then
        return
    end
    if GameTime() - defendPings.pingedTime <= (isBaseThreat and 3 or 6) then
        return
    end
    local saferLoc = add(
        jmz.AdjustLocationWithOffsetTowardsFountain(
            building:GetLocation(),
            850
        ),
        RandomVector(50)
    )
    local retreaters = jmz.GetRetreatingAlliesNearLoc(saferLoc, 1600)
    if #retreaters == 0 or isBaseThreat then
        bot:ActionImmediate_Chat(
            Localization.Get("say_come_def"),
            false
        )
        bot:ActionImmediate_Ping(saferLoc.x, saferLoc.y, false)
        defendPings.pingedTime = GameTime()
        defendPings.lane = lane
    end
end
function ____exports.GetDefendDesireHelper(bot, lane)
    if bot.laneToDefend == nil then
        bot.laneToDefend = lane
    end
    if bot.DefendLaneDesire == nil then
        bot.DefendLaneDesire = {0, 0, 0}
    end
    local gameState = getGlobalGameState()
    local locationState = getGlobalLocationState()
    local unitState = getGlobalUnitState()
    local team = gameState.team
    local ancient = gameState.ourAncient
    local baseThreatLevel = GetBaseThreatLevel()
    local baseThreatActiveNow = baseThreatLevel >= 2
    local baseThreatSevere = baseThreatLevel >= 3
    local ds = getDefendState(bot)
    ds.defendLoc = locationState.laneFronts[lane]
    local distanceToDefendLoc = GetUnitToLocationDistance(bot, ds.defendLoc)
    local botLevel = bot:GetLevel()
    if not baseThreatActiveNow and bot:GetAssignedLane() ~= lane and distanceToDefendLoc > 3000 then
        local posNow = jmz.GetPosition(bot)
        if posNow == 1 and botLevel < 6 or posNow == 2 and botLevel < 6 or posNow == 3 and botLevel < 5 or posNow == 4 and botLevel < 4 or posNow == 5 and botLevel < 4 then
            return BotModeDesire.None
        end
    end
    if botLevel < 3 and not baseThreatActiveNow then
        return BotModeDesire.None
    end
    if not baseThreatActiveNow then
        local closeEnemiesDefend = jmz.GetEnemiesNearLoc(
            bot:GetLocation(),
            900
        )
        local closeAlliesDefend = jmz.GetAlliesNearLoc(
            bot:GetLocation(),
            900
        )
        if #closeEnemiesDefend > 0 and #closeAlliesDefend >= #closeEnemiesDefend then
            return math.min(0.3, BotModeDesire.Moderate)
        end
    end
    if not baseThreatActiveNow then
        local forceGroupPushLevel = math.max(
            1,
            math.min(3, Customize.Force_Group_Push_Level or 1)
        )
        local pushGroupThreshold = 4 - forceGroupPushLevel
        local teamIsPushing = false
        do
            local i = 1
            while i <= #GetTeamPlayers(nTeam) do
                local member = GetTeamMember(i)
                if member and member ~= bot and member:IsAlive() then
                    local mode = member:GetActiveMode()
                    if mode == BotMode.PushTowerTop or mode == BotMode.PushTowerMid or mode == BotMode.PushTowerBot then
                        local alliesNear = jmz.GetAlliesNearLoc(
                            member:GetLocation(),
                            1600
                        )
                        if #alliesNear >= pushGroupThreshold then
                            teamIsPushing = true
                            break
                        end
                    end
                end
                i = i + 1
            end
        end
        if teamIsPushing then
            return BotModeDesire.VeryLow
        end
    end
    local recentlyHit = bot:WasRecentlyDamagedByAnyHero(5) or bot:WasRecentlyDamagedByTower(5)
    local humanPressureLane = ____exports.GetHumanLanePressureLane()
    local threatenedLane = baseThreatActiveNow and GetThreatenedLane() or (humanPressureLane ~= nil and humanPressureLane or GetThreatenedLane())
    if baseThreatActiveNow and lane ~= threatenedLane then
        return BotModeDesire.VeryLow
    end
    local panic = {active = false, floor = 0}
    if humanPressureLane ~= nil and lane == humanPressureLane then
        panic = {
            active = true,
            floor = 0.9,
            forceLoc = GetLaneFrontLocation(nTeam, lane, -250)
        }
    end
    if baseThreatActiveNow then
        baseThreatUntil = DotaTime() + BASE_THREAT_HOLD
        local panicFloor = baseThreatSevere and 0.97 or 0.9
        local forceLoc = ancient and jmz.AdjustLocationWithOffsetTowardsFountain(
            ancient:GetLocation(),
            300
        ) or ds.defendLoc
        panic = {
            active = true,
            floor = math.max(panic.floor, panicFloor),
            forceLoc = forceLoc
        }
        bot.laneToDefend = lane
        local enemyTeamIds = GetTeamPlayers(gameState.enemyTeam)
        local threatenedLaneLoc = threatenedLane == Lane.Top and GetLaneFrontLocation(nTeam, Lane.Top, 0) or (threatenedLane == Lane.Bot and GetLaneFrontLocation(nTeam, Lane.Bot, 0) or GetLaneFrontLocation(nTeam, Lane.Mid, 0))
        local incoming = __TS__ArrayFilter(
            GetIncomingTeleports(),
            function(____, tp)
                if not tp then
                    return false
                end
                local isEnemy = __TS__ArraySome(
                    enemyTeamIds,
                    function(____, id) return id == tp.playerid end
                )
                return not isEnemy and jmz.GetDistance(tp.location, threatenedLaneLoc) <= 3000
            end
        )
        if #incoming >= 1 then
            baseThreatUntil = DotaTime() + BASE_THREAT_HOLD + 4
        end
    end
    if ancient then
        local heroesNearAncient = jmz.Utils.CountEnemyHeroesNear(
            ancient:GetLocation(),
            BASE_THREAT_RADIUS
        )
        if heroesNearAncient >= 1 then
            baseThreatUntil = DotaTime() + BASE_THREAT_HOLD
        elseif IsBaseThreatActive() then
            local creepWeight = WeightedEnemiesAroundLocation(
                ancient:GetLocation(),
                BASE_THREAT_RADIUS
            )
            if creepWeight >= 2 then
                baseThreatUntil = DotaTime() + 1.5
            end
        end
    end
    if panic.active and panic.forceLoc then
        ds.defendLoc = panic.forceLoc
    elseif IsBaseThreatActive() and ancient then
        ds.defendLoc = jmz.AdjustLocationWithOffsetTowardsFountain(
            ancient:GetLocation(),
            300
        )
    elseif jmz.Utils.GetLocationToLocationDistance(gameState.teamFountainTpPoint, ds.defendLoc) < 3000 then
        local enemyLaneFront = locationState.enemyLaneFronts[lane]
        local eNear = jmz.GetLastSeenEnemiesNearLoc(enemyLaneFront, 1600)
        local aNear = jmz.GetAlliesNearLoc(enemyLaneFront, 1600)
        if GetUnitToLocationDistance(bot, enemyLaneFront) > bot:GetAttackRange() and #eNear <= #aNear + 1 then
            ds.defendLoc = enemyLaneFront
        end
    end
    ds.distanceToLane[lane] = GetUnitToLocationDistance(bot, ds.defendLoc)
    ds.nInRangeAlly = jmz.GetNearbyHeroes(bot, 1600, false, BotMode.None)
    ds.nInRangeEnemy = jmz.GetLastSeenEnemiesNearLoc(
        bot:GetLocation(),
        1600
    )
    ds.weAreStronger = jmz.WeAreStronger(bot, 2500)
    if not baseThreatActiveNow then
        local pos = jmz.GetPosition(bot)
        local bMyLane = bot:GetAssignedLane() == lane
        local enemiesAtAncient = ancient and jmz.Utils.CountEnemyHeroesNear(
            ancient:GetLocation(),
            2200
        ) or 0
        if #ds.nInRangeEnemy > 0 then
            return BotModeDesire.VeryLow
        end
        if not bMyLane and pos == 1 and gameState.isLaningPhase then
            return BotModeDesire.VeryLow
        end
        if jmz.IsDoingRoshan(bot) and #jmz.GetAlliesNearLoc(
            jmz.GetCurrentRoshanLocation(),
            2800
        ) >= 3 then
            return BotModeDesire.VeryLow
        end
        if jmz.IsDoingTormentor(bot) and (#jmz.GetAlliesNearLoc(
            jmz.GetTormentorLocation(team),
            1600
        ) >= 2 or #jmz.GetAlliesNearLoc(
            jmz.GetTormentorWaitingLocation(team),
            2500
        ) >= 2) and enemiesAtAncient == 0 then
            return BotModeDesire.VeryLow
        end
    end
    local pingFloor = 0
    local human, humanPing = jmz.GetHumanPing()
    if human and humanPing and humanPing.normal_ping and DotaTime() > 0 then
        local isPinged, pingedLane = jmz.IsPingCloseToValidTower(gameState.team, humanPing, 800, 5)
        if isPinged and lane == pingedLane and GameTime() < humanPing.time + PING_DELTA then
            bot.laneToDefend = lane
            pingFloor = 0.95
        end
    end
    local furthestBuilding, urgentMul, buildingTier = unpack(____exports.GetFurthestBuildingOnLane(lane))
    if not IsValidBuildingTarget(furthestBuilding) then
        return BotModeDesire.None
    end
    local shouldDef = ____exports.ShouldDefend(bot, furthestBuilding, 1600)
    local isBaseBuilding = buildingTier >= 3
    local creepsNearBase = isBaseBuilding and __TS__ArraySome(
        unitState.enemyCreeps,
        function(____, u) return jmz.IsValid(u) and GetUnitToUnitDistance(furthestBuilding, u) <= 1200 end
    )
    if not shouldDef and not baseThreatActiveNow then
        local dist = ds.distanceToLane[lane]
        local tp = jmz.Utils.GetItemFromFullInventory(bot, "item_tpscroll")
        local nearEnemiesAtBuilding = jmz.GetLastSeenEnemiesNearLoc(
            furthestBuilding:GetLocation(),
            1200
        )
        local buildingUnderAttack = furthestBuilding:GetHealth() < furthestBuilding:GetMaxHealth()
        if not jmz.CanCastAbility(tp) and dist and dist > 4000 and #nearEnemiesAtBuilding == 0 and not buildingUnderAttack or #nearEnemiesAtBuilding == 0 and (not isBaseBuilding or not creepsNearBase) and not buildingUnderAttack and #jmz.GetAlliesNearLoc(
            furthestBuilding:GetLocation(),
            1600
        ) >= 1 then
            return BotModeDesire.VeryLow
        end
    end
    local nDefendDesire = GetDefendLaneDesire(lane)
    local hub = furthestBuilding:GetLocation()
    local lEnemies = jmz.GetLastSeenEnemiesNearLoc(hub, 2500)
    local nDefendAllies = jmz.GetAlliesNearLoc(hub, 2500)
    local nEffAllies = #nDefendAllies + #jmz.Utils.GetAllyIdsInTpToLocation(hub, 2500)
    local buildingDamaged = furthestBuilding:GetHealth() < furthestBuilding:GetMaxHealth()
    if not baseThreatActiveNow then
        if #lEnemies == 0 and (not isBaseBuilding or not creepsNearBase) and not buildingDamaged and (#jmz.GetAlliesNearLoc(hub, 1600) >= 2 or jmz.IsCore(bot)) then
            return BotModeDesire.VeryLow
        end
        if #lEnemies == 1 and not buildingDamaged and (nEffAllies > #lEnemies or #jmz.GetAlliesNearLoc(hub, 1600) >= 2 and jmz.GetAverageLevel(false) >= jmz.GetAverageLevel(true)) then
            return BotModeDesire.VeryLow
        end
    end
    local capBoost = (shouldDef or baseThreatActiveNow) and 0.1 or 0
    local maxDesire = (buildingTier >= 3 and nEffAllies >= #lEnemies and 1 or MAX_DESIRE_CAP) + capBoost
    maxDesire = math.min(maxDesire, 1)
    local baseFloor = (shouldDef or baseThreatActiveNow) and BotActionDesire.Low or BotActionDesire.VeryLow
    nDefendDesire = RemapValClamped(
        jmz.GetHP(bot),
        0.75,
        0.2,
        RemapValClamped(
            nDefendDesire * urgentMul,
            0,
            1,
            baseFloor,
            maxDesire
        ),
        BotActionDesire.Low
    )
    do
        local dist = ds.distanceToLane[lane]
        if not baseThreatActiveNow and dist and dist < 1600 and #ds.nInRangeEnemy > #ds.nInRangeAlly and not ds.weAreStronger then
            nDefendDesire = RemapValClamped(
                nDefendDesire,
                0,
                1,
                BotActionDesire.VeryLow,
                BotActionDesire.High
            )
        end
    end
    if not baseThreatActiveNow then
        local botTarget = jmz.GetProperTarget(bot)
        if jmz.IsValidHero(botTarget) and jmz.GetHP(botTarget) < 0.6 and jmz.GetHP(bot) > jmz.GetHP(botTarget) and GetUnitToUnitDistance(bot, botTarget) < 1500 then
            nDefendDesire = nDefendDesire * 0.4
        end
    end
    if not baseThreatActiveNow then
        local tp = jmz.Utils.GetItemFromFullInventory(bot, "item_tpscroll")
        local dist = ds.distanceToLane[lane]
        if not jmz.CanCastAbility(tp) and dist and dist > 4000 then
            local nearEnemies = jmz.GetLastSeenEnemiesNearLoc(
                furthestBuilding:GetLocation(),
                1200
            )
            if #nearEnemies == 0 or bot:WasRecentlyDamagedByAnyHero(2) then
                nDefendDesire = nDefendDesire * 0.5
            end
            nDefendDesire = RemapValClamped(
                dist / 4000,
                0,
                2,
                nDefendDesire,
                BotActionDesire.VeryLow
            )
        end
    end
    if not baseThreatActiveNow and furthestBuilding ~= ancient then
        local hp = jmz.GetHP(furthestBuilding)
        if buildingTier == 1 and hp <= 0.15 or buildingTier == 2 and hp <= 0.1 then
            return BotModeDesire.None
        end
    end
    if panic.active then
        nDefendDesire = math.max(nDefendDesire, panic.floor)
    end
    if pingFloor > 0 then
        nDefendDesire = math.max(nDefendDesire, pingFloor)
    end
    if baseThreatActiveNow and shouldDef then
        nDefendDesire = math.max(nDefendDesire, baseThreatSevere and 0.97 or 0.9)
    end
    ConsiderPingedDefend(
        bot,
        lane,
        nDefendDesire,
        furthestBuilding,
        buildingTier,
        nEffAllies,
        #lEnemies
    )
    if recentlyHit and not baseThreatActiveNow then
        nDefendDesire = nDefendDesire * 0.4
        if #ds.nInRangeEnemy >= #ds.nInRangeAlly and not ds.weAreStronger then
            nDefendDesire = math.min(nDefendDesire, BotActionDesire.Low)
        end
    end
    if nDefendDesire > 0.7 then
        jmz.Utils.GameStates = jmz.Utils.GameStates or ({})
        jmz.Utils.GameStates.recentDefendTime = DotaTime()
        bot.laneToDefend = lane
    end
    return nDefendDesire
end
okLoc, Localization = pcall(
    require,
    GetScriptDirectory() .. "/FunLib/localization"
)
if not okLoc then
    Localization = {Get = function(_) return "Defend here!" end}
end
Customize = require(GetScriptDirectory().."/Customize/general")
____exports.BaseThreatLevel = BaseThreatLevel
____exports.GetBaseThreatLevel = GetBaseThreatLevel
____exports.GetDesignatedResponders = GetDesignatedResponders
____exports.IsEnemyThreatNearOurBase = IsEnemyThreatNearOurBase
local ____Customize_1 = Customize
local ____Customize_Enable_0
if Customize.Enable then
    ____Customize_Enable_0 = Customize.ThinkLess
else
    ____Customize_Enable_0 = 1
end
____Customize_1.ThinkLess = ____Customize_Enable_0
PING_DELTA = 5
local SEARCH_RANGE_DEFAULT = 1600
MAX_DESIRE_CAP = 0.98
BASE_THREAT_RADIUS = 2600
BASE_THREAT_HOLD = 8
CACHE_ENEMY_AROUND_LOC_HZ = 0.35
CACHE_LASTSEEN_WINDOW = 5
nTeam = GetTeam()
_threatLaneSticky = {lane = Lane.Mid, ["until"] = -1}
baseThreatUntil = -1
fTraveBootsDefendTime = 0
_cacheEnemyAroundLoc = {}
function ____exports.GetDefendDesire(bot, lane)
    if bot:IsInvulnerable() or not bot:IsHero() or not bot:IsAlive() or not __TS__StringIncludes(
        bot:GetUnitName(),
        "hero"
    ) or bot:IsIllusion() then
        return BotModeDesire.None
    end
    local res = ____exports.GetDefendDesireHelper(bot, lane)
    bot.defendDesire = res
    return res
end
function ____exports.DefendThink(bot, lane)
    local now = DotaTime()
    local activeMode = bot:GetActiveMode()
    local isDefendMode = activeMode == BotMode.DefendTowerTop or activeMode == BotMode.DefendTowerMid or activeMode == BotMode.DefendTowerBot
    local justEnteredDefend = isDefendMode and bot._lastActiveMode ~= activeMode
    bot._lastActiveMode = activeMode
    local bWasTeleportingNow = bot:HasModifier("modifier_teleporting")
    if bWasTeleportingNow then
        bot._teleportingLastSeen = DotaTime()
    end
    local bJustFinishedTp = not bWasTeleportingNow and bot._teleportingLastSeen ~= nil and DotaTime() - bot._teleportingLastSeen < 1
    if justEnteredDefend or bJustFinishedTp then
        if jmz.IsBotBusyChannelingOrStunned(bot) then
            return
        end
    else
        if jmz.CanNotUseAction(bot) then
            return
        end
        if jmz.Utils.IsBotThinkingMeaningfulAction(bot, Customize.ThinkLess, "defend") then
            return
        end
    end
    do
        local baseThreat = GetBaseThreatLevel()
        if baseThreat >= 2 then
            local threatBld = unpack(____exports.GetFurthestBuildingOnLane(lane))
            local anc = GetAncient(nTeam)
            local targetLoc = IsValidBuildingTarget(threatBld) and threatBld:GetLocation() or (anc and IsValidBuildingTarget(anc) and anc:GetLocation() or nil)
            if targetLoc then
                local distToTarget = GetUnitToLocationDistance(bot, targetLoc)
                if distToTarget > 2000 then
                    local dest = add(
                        jmz.AdjustLocationWithOffsetTowardsFountain(targetLoc, 250),
                        jmz.RandomForwardVector(150)
                    )
                    local tp = jmz.GetItem2(bot, "item_tpscroll")
                    if jmz.CanCastAbility(tp) then
                        bot:Action_UseAbilityOnLocation(tp, dest)
                        return
                    end
                    bot:Action_MoveToLocation(dest)
                    return
                end
            end
        end
    end
    local botLocation = bot:GetLocation()
    local pathCacheKey = (("pathEnemies_" .. tostring(bot:GetPlayerID())) .. "_") .. tostring(math.floor(now * 2))
    local pathEnemies
    if not bot[pathCacheKey] then
        pathEnemies = jmz.GetLastSeenEnemiesNearLoc(botLocation, 1600)
        bot[pathCacheKey] = pathEnemies
        __TS__ArrayForEach(
            __TS__ObjectKeys(bot),
            function(____, key)
                if __TS__StringStartsWith(key, "pathEnemies_") and key ~= pathCacheKey then
                    __TS__Delete(bot, key)
                end
            end
        )
    else
        pathEnemies = bot[pathCacheKey]
    end
    local ds = getDefendState(bot)
    local inBaseThreatNow = IsBaseThreatActive()
    if not inBaseThreatNow and bot:WasRecentlyDamagedByAnyHero(5) and #pathEnemies > #ds.nInRangeEnemy then
        local safe = jmz.AdjustLocationWithOffsetTowardsFountain(
            bot:GetLocation(),
            700
        )
        bot:Action_MoveToLocation(add(
            safe,
            jmz.RandomForwardVector(120)
        ))
        return
    end
    if inBaseThreatNow then
        local threatBld = unpack(____exports.GetFurthestBuildingOnLane(lane))
        local threatAnchor = IsValidBuildingTarget(threatBld) and threatBld:GetLocation() or GetLaneFrontLocation(nTeam, lane, 0)
        local liveEnemies = bot:GetNearbyHeroes(1600, true, BotMode.None)
        for ____, e in ipairs(liveEnemies) do
            do
                local __continue207
                repeat
                    if not jmz.IsValidHero(e) or jmz.IsSuspiciousIllusion(e) then
                        __continue207 = true
                        break
                    end
                    if jmz.IsInRange(
                        bot,
                        e,
                        bot:GetAttackRange() + 250
                    ) then
                        bot:Action_AttackUnit(e, true)
                        return
                    end
                    bot:Action_MoveToLocation(e:GetLocation())
                    return
                until true
                if not __continue207 then
                    break
                end
            end
        end
        local seenEnemies = jmz.GetLastSeenEnemiesNearLoc(threatAnchor, 1600)
        if #seenEnemies > 0 then
            bot:Action_MoveToLocation(add(
                threatAnchor,
                jmz.RandomForwardVector(200)
            ))
            return
        end
        local distToAnchor = GetUnitToLocationDistance(bot, threatAnchor)
        if distToAnchor > 400 then
            bot:Action_MoveToLocation(add(
                threatAnchor,
                jmz.RandomForwardVector(200)
            ))
            return
        end
        bot:Action_AttackMove(add(
            threatAnchor,
            jmz.RandomForwardVector(300)
        ))
        return
    end
    local attackRange = bot:GetAttackRange()
    local nSearchRange = attackRange < 900 and 900 or math.min(attackRange, SEARCH_RANGE_DEFAULT)
    if not ds.defendLoc then
        ds.defendLoc = GetLaneFrontLocation(nTeam, lane, 0)
    end
    local bld, _, buildingTier = unpack(____exports.GetFurthestBuildingOnLane(lane))
    local hub = ds.defendLoc
    if IsValidBuildingTarget(bld) then
        hub = bld:GetLocation()
    end
    if not hub then
        hub = GetLaneFrontLocation(nTeam, lane, 0)
    end
    if buildingTier >= 3 then
        local edgeInside = GetHighGroundEdgeWaitPoint(nTeam, lane)
        local enemyAtHG = jmz.Utils.CountEnemyHeroesOnHighGround(nTeam)
        local nearEdgeEnemies = jmz.GetLastSeenEnemiesNearLoc(edgeInside, 1200)
        local nearEdgeAllies = jmz.GetAlliesNearLoc(edgeInside, 1400)
        if enemyAtHG == 0 and #nearEdgeEnemies > 0 and #nearEdgeAllies >= #nearEdgeEnemies + 1 then
            local attackMoveLoc = add(
                edgeInside,
                jmz.RandomForwardVector(120)
            )
            bot:Action_AttackMove(attackMoveLoc)
        else
            local deeper = jmz.AdjustLocationWithOffsetTowardsFountain(edgeInside, 200)
            local attackMoveLoc = add(
                deeper,
                jmz.RandomForwardVector(120)
            )
            bot:Action_AttackMove(attackMoveLoc)
        end
        return
    end
    local enemiesAtHub = jmz.GetEnemiesNearLoc(hub, SEARCH_RANGE_DEFAULT)
    if jmz.IsValidHero(enemiesAtHub[1]) and jmz.IsInRange(bot, enemiesAtHub[1], nSearchRange) then
        bot:Action_AttackUnit(enemiesAtHub[1], true)
        return
    end
    local nEnemyHeroes = bot:GetNearbyHeroes(SEARCH_RANGE_DEFAULT, true, BotMode.None)
    if jmz.IsValidHero(nEnemyHeroes[1]) and jmz.IsInRange(bot, nEnemyHeroes[1], nSearchRange) then
        bot:Action_AttackUnit(nEnemyHeroes[1], true)
        return
    end
    local creeps = bot:GetNearbyCreeps(900, true)
    if creeps and #creeps > 0 and (not enemiesAtHub or #enemiesAtHub == 0) then
        local best = nil
        local bestDmg = -1
        for ____, c in ipairs(creeps) do
            if jmz.IsValid(c) and jmz.CanBeAttacked(c) then
                local dmg = c:GetAttackDamage()
                if dmg > bestDmg then
                    best = c
                    bestDmg = dmg
                end
            end
        end
        if best then
            bot:Action_AttackUnit(best, true)
            return
        end
    end
    if bld and ____exports.ShouldDefend(bot, bld, 1600) then
        local attackMoveLoc = add(
            hub,
            jmz.RandomForwardVector(300)
        )
        bot:Action_AttackMove(attackMoveLoc)
        return
    end
    local dist = ds.distanceToLane[lane] or GetUnitToLocationDistance(bot, hub)
    if (ds.weAreStronger or #ds.nInRangeAlly >= #ds.nInRangeEnemy) and dist < SEARCH_RANGE_DEFAULT then
        local attackMoveLoc = add(
            hub,
            jmz.RandomForwardVector(300)
        )
        bot:Action_AttackMove(attackMoveLoc)
    elseif dist > SEARCH_RANGE_DEFAULT * 1.7 then
        local moveLoc = add(
            hub,
            jmz.RandomForwardVector(300)
        )
        bot:Action_MoveToLocation(moveLoc)
    else
        local moveLoc = add(
            hub,
            jmz.RandomForwardVector(1000)
        )
        bot:Action_MoveToLocation(moveLoc)
    end
end
function ____exports.OnEnd()
end
return ____exports
