--- @class Defence : Component
--- @field maxDefence integer
--- @field defence integer
--- @overload fun(defence: integer): Defence
local Defence = prism.Component:extend("Defence")

function Defence:__new(maxDefence)
   self.maxDefence = maxDefence
   self.defence = maxDefence
end

--- @class DefenceModifier : ConditionModifier
--- @field maxDefence integer
--- @overload fun(delta: integer): DefenceModifier
local DefenceModifier = prism.condition.ConditionModifier:extend "DefenceModifier"

function DefenceModifier:__new(delta)
   self.maxDefence = delta
end

prism.register(DefenceModifier)

return Defence