local controls = require "controls"

--- @class PlayerStatsPageState : GameState
--- @field display Display
--- @overload fun(display: Display): PlayerStatsPageState
local PlayerStatsPageState = spectrum.GameState:extend("PlayerStatsPageState")


--- @param display Display
--- @param decision ActionDecision
--- @param level Level
function PlayerStatsPageState:__new(display, decision, level)
    self.display = display
    self.decision = decision
    self.level = level
end

function PlayerStatsPageState:load(previous)
    self.previousState = previous
end

local function get_total_defence(player)
    local player_def = player:get(prism.components.Defence)
    local base_defence = player_def.defence
    local bonus = 0
    
    local equipper = player:get(prism.components.Equipper)
    if equipper then
        for i, slot in pairs(equipper.slots) do
            if equipper.equipped[slot.name] and equipper.equipped[slot.name]:has(prism.components.Defence) then
                bonus = bonus + equipper.equipped[slot.name]:get(prism.components.Defence).defence
            end
        end
    end
    return base_defence + bonus
end


local function get_total_attack(player)
    local player_att = player:get(prism.components.AttackStatus)
    local base_attack = player_att.attack
    local bonus = 0
    
    local equipper = player:get(prism.components.Equipper)
    if equipper then
        for i, slot in pairs(equipper.slots) do
            if equipper.equipped[slot.name] and equipper.equipped[slot.name]:has(prism.components.AttackStatus) then
                bonus = bonus + equipper.equipped[slot.name]:get(prism.components.AttackStatus).attack
            end
        end
    end
    return base_attack + bonus
end

function PlayerStatsPageState:draw()
    local player = self.level:query(prism.components.PlayerController):first()
    self.previousState:draw()
    self.display:clear()
    local zoom = 2.0
    local visibleCols = (love.graphics.getWidth() / zoom) / 16
    local edge = math.floor(visibleCols) - 1
    
    self.display:print(1, 2, "Player Stats")

    if player then
        local health = player:get(prism.components.Health)
        local defence = player:get(prism.components.Defence)
        local total_def = get_total_defence(player)
        local total_att = get_total_attack(player)
        local hunger = player:get(prism.components.Hunger)
        local curHP = health.hp
        local maxHP = health:getMaxHP()
        self.display:print(1, 3, ("Health: %d/%d"):format(curHP, maxHP))
        self.display:print(1, 4, ("Attack: %d"):format(total_att))
        self.display:print(1, 5, ("Defence: %d"):format(total_def))
        self.display:print(1, 6, ("Hunger: %d"):format(hunger.hunger))
    end

    self.display:draw()
end


function PlayerStatsPageState:update(dt)
    controls:update()
    if controls.stats.pressed or controls.back.pressed then self.manager:pop() end
end
return PlayerStatsPageState