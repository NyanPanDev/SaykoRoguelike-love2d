local KickTarget = prism.Target(prism.components.Collider)
   :range(1)
   :sensed()

local Log = prism.components.Log
local Name = prism.components.Name

---@class KickAction : Action
local Kick = prism.Action:extend("Kick")
Kick.targets = { KickTarget }
Kick.requiredComponents = {
   prism.components.Controller
}


function Kick:canPerform(level)
   return true
end

local mask = prism.Collision.createBitmaskFromMovetypes{ "fly" }

--- @param level Level
--- @param kicked Actor
function Kick:perform(level, kicked)

   local damage = prism.actions.Damage(kicked, 1)
   level:tryPerform(damage)


   local kickName = Name.lower(kicked)
   local ownerName = Name.lower(self.owner)
   local dealt = damage.dealt or 0

   Log.addMessage(self.owner, "You kick the %s.", kickName, dealt)
   Log.addMessage(kicked, "The %s kicks you!", ownerName, dealt)
   Log.addMessageSensed(level, self, "The %s kicks the %s.", ownerName, kickName, dealt)
end

return Kick