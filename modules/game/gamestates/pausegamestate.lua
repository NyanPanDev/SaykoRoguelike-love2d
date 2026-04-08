local controls = require "controls"

--- @class PauseGameState : GameState
--- @field display Display
--- @overload fun(display: Display): PauseGameState
local PauseGameState = spectrum.GameState:extend "PauseGameState"

function PauseGameState:__new(display)
   self.display = display
end

function PauseGameState:draw()
    local midpoint = math.floor(self.display.height / 2)
    self.display:print(1, midpoint, "Game Paused", nil, nil, nil, "center", self.display.width)
    self.display:print(1, midpoint + 2, "[Escape] to resume", nil, nil, nil, "center", self.display.width)
    self.display:print(1, midpoint + 4, "[n] to quit to main menu", nil, nil, nil, "center", self.display.width)
    self.display:draw()
end


function PauseGameState:update(dt)
    controls:update()

    if controls.newgame.pressed then
        self.manager:enter(spectrum.gamestates.GameStartState(self.display))
        return
    end

    if controls.quit.pressed then
        self.manager:pop()
    end
end

return PauseGameState