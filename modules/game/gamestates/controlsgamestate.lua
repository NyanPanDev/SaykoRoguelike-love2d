local controls = require "controls"

--- @class ControlsGameState : GameState
--- @field display Display
--- @overload fun(display: Display): ControlsGameState
local ControlsGameState = spectrum.GameState:extend "ControlsGameState"

function ControlsGameState:__new(display)
   self.display = display
end

function ControlsGameState:draw()
   local midpoint = math.floor(self.display.height / 2)
   self.display:print(1, midpoint - 2, "Controls", nil, nil, nil, "center", self.display.width)

   local controlList = {
      "Move: WASD",
      "Wait: Z",
      "Inventory: Tab",
      "Stats: .",
      "Restart: R",
      "Quit: Escape"
   }

   for i, control in ipairs(controlList) do
      self.display:print(1, midpoint + i - 1, control, nil, nil, nil, "center", self.display.width)
   end

   self.display:print(1, midpoint + #controlList + 1, "[Escape] to return to Main Menu", nil, nil, nil, "center", self.display.width)
   self.display:draw()
end

function ControlsGameState:update(dt)
    controls:update()

    if controls.quit.pressed then
        self.manager:enter(spectrum.gamestates.GameStartState(self.display))
        return
    end
end

return ControlsGameState