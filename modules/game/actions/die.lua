---@class Die : Action
---@overload fun(owner: Actor): Die
local Die = prism.Action:extend("Die")

function Die:perform(level)
    
    if not level:query(prism.components.PlayerController):first() then
       level:yield(prism.messages.LoseMessage())
    end
end

return Die