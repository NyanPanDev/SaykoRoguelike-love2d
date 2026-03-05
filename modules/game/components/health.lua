--- @class Health : Component
--- @field private maxHP integer
--- @field hp integer
--- @overload fun(hp: integer): Health
local Health = prism.Component:extend("Health")

function Health:__new(maxHP)
   self.maxHP = maxHP
   self.hp = maxHP
end

--- @param amount integer
function Health:heal(amount)
   self.hp = math.min(self.hp + amount, self:getMaxHP())
end

--- @class HealthModifier : ConditionModifier
--- @field maxHP integer
--- @overload fun(delta: integer): HealthModifier
local HealthModifier = prism.condition.ConditionModifier:extend "HealthModifier"

function HealthModifier:__new(delta)
   self.maxHP = delta
end

prism.register(HealthModifier)


--- @return integer maxHP
function Health:getMaxHP()
   local modifiers = prism.components.ConditionHolder.getActorModifiers(self.owner, HealthModifier)

   local modifiedMaxHP = self.maxHP
   for _, modifier in ipairs(modifiers) do
      modifiedMaxHP = modifiedMaxHP + modifier.maxHP
   end

   return modifiedMaxHP
end

function Health:enforceBounds()
   self.hp = math.min(self.hp, self:getMaxHP())
end

return Health