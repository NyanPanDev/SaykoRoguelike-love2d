local DamageTarget = prism.Target():isType("number")
local Log = prism.components.Log

--- @class Damage : Action
--- @overload fun(owner: Actor, damage: number): Damage
local Damage = prism.Action:extend("Damage")
Damage.targets = { DamageTarget }
Damage.requiredComponents = { prism.components.Health }

function Damage:perform(level, damage)
   local health = self.owner:expect(prism.components.Health)
   local defence = self.owner:get(prism.components.Defence)
   local defenceVal = defence and defence.defence or 0
   --- defence has a chance for attacks to miss
   local missThreshold = defenceVal * 5
   if love.math.random(100) <= missThreshold then
      self.dealt = 0
      Log.addMessage(self.owner, "The attack misses!")
      return
   end
   health.hp = health.hp - damage
   self.dealt = damage

   if health.hp <= 0 then
      level:perform(prism.actions.Die(self.owner))
   end
end

return Damage