--- @class HurtZappableOptions : ZappableOptions
--- @field damage integer

--- @class HurtZappable : Zappable
--- @overload fun(options: HurtZappableOptions): HurtZappable
prism.components.Zappable = require "modules/base/components/zappable"
local HurtZappable = prism.components.Zappable:extend "HurtZappable"

--- @param options HurtZappableOptions
function HurtZappable:__new(options)
    prism.components.Zappable.__new(self, options)
    self.damage = options.damage
end

return HurtZappable