local controls = require "controls"

--- @class PlayerStatsPageState : GameState
--- @field display Display
--- @overload fun(display: Display): PlayerStatsPageState
local PlayerStatsPageState = spectrum.GameState:extend("PlayerStatsPageState")



return PlayerStatsPageState