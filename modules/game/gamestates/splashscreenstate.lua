--- @class SplashScreenState : GameState
--- @field display Display
--- @overload fun(display: Display): SplashScreenState
local SplashScreenState = spectrum.GameState:extend("SplashScreenState")

return SplashScreenState