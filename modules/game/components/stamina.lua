--- @class Stamina : Component
--- @field maxStamina integer
--- @field stamina integer
--- @overload fun(stamina: integer): Stamina
local Stamina = prism.Component:extend("Stamina")

function Stamina:__new(maxStamina)
   self.maxStamina = maxStamina
   self.stamina = maxStamina
end

--- @param amount integer
function Stamina:heal(amount)
   self.stamina = math.min(self.stamina + amount, self.maxStamina)
end

return Stamina