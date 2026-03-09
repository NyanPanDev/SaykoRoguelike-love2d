--- @class Tick : Action
local Tick = prism.Action:extend "Tick"
Tick.requiredComponents = { prism.components.ConditionHolder }

--- @param level Level
function Tick:perform(level)
   -- Handle status effect durations
   self.owner
      :expect(prism.components.ConditionHolder)
      :each(function(condition)
         if prism.conditions.TickedCondition:is(condition) then
            --- @cast condition TickedCondition
            condition.duration = condition.duration - 1
         end
      end)

    :removeIf(function(condition)
        --- @cast condition TickedCondition
        return prism.conditions.TickedCondition:is(condition)
            and condition.duration <= 0
    end)

    -- Handle hunger ticking
    local hunger = self.owner:get(prism.components.Hunger)
    if hunger then
        hunger.tickCounter = (hunger.tickCounter or 0) + 1
        local tickRate = 10

        if hunger.tickCounter >= tickRate then
            hunger.tickCounter = 0
            hunger.hunger = math.max(hunger.hunger - 1, 0)
        end
        --- todo: starvation
        if hunger.hunger <= 0 then
            -- local health = self.owner:get(prism.components.Health)
            -- health = health - 1 -- Starvation damage
        end
    end

   -- Validate components
   local health = self.owner:get(prism.components.Health)
   if health then health:enforceBounds() end
end

return Tick