--- @class Stamina : Component
--- @field maxStamina integer
--- @field stamina integer
--- @overload fun(hunger: integer): Hunger
local Hunger = prism.Component:extend("Hunger")

function Hunger:__new(maxHunger)
   self.maxHunger = maxHunger
   self.hunger = maxHunger
end

--- @param amount integer
function Hunger:heal(amount)
   self.hunger = math.min(self.hunger + amount, self.maxHunger)
end

return Hunger