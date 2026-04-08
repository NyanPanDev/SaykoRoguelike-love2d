--- @class AttackStatus : Component
--- @field maxAttack integer
--- @field attack integer
--- @overload fun(attack: integer): Attack
local AttackStatus = prism.Component:extend("AttackStatus")

function AttackStatus:__new(maxAttack)
   self.maxAttack = maxAttack
   self.attack = maxAttack
end

--- @class AttackModifier : ConditionModifier
--- @field maxAttack integer
--- @overload fun(delta: integer): AttackModifier
local AttackModifier = prism.condition.ConditionModifier:extend "AttackModifier"

function AttackModifier:__new(delta)
   self.maxAttack = delta
end

prism.register(AttackModifier)

return AttackStatus