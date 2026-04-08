local Log = prism.components.Log
local Name = prism.components.Name

--- @class Wait : Action
--- @overload fun(owner: Actor): Wait
local Wait = prism.Action:extend("Wait")

function Wait:canPerform()
   return true
end

function Wait:perform(level) 
   Log.addMessage(self.owner, "You wait for a moment.")
   Log.addMessageSensed(level, self, "%s waits for a moment.", Name.get(self.owner))
end

return Wait
