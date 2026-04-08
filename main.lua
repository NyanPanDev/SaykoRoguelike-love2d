require "debugger"
require "prism"
require "game"

prism.loadModule("prism/spectrum")
prism.loadModule("prism/geometer")
prism.loadModule("prism/extra/sight")
prism.loadModule("prism/extra/log")
prism.loadModule("prism/extra/inventory")
prism.loadModule("prism/extra/droptable")
prism.loadModule("prism/extra/condition")
prism.loadModule("prism/extra/equipment")
prism.loadModule("modules/game")

-- Used by Geometer for new maps
prism.defaultCell = prism.cells.Pit

-- Load a sprite atlas and configure the terminal-style display,
love.graphics.setDefaultFilter("nearest", "nearest")
local spriteAtlas = spectrum.SpriteAtlas.fromASCIIGrid("display/wanderlust_16x16.png", 16, 16)
local display = spectrum.Display(81, 41, spriteAtlas, prism.Vector2(16, 16))


-- spin up our state machine
--- @type GameStateManager
local manager = spectrum.StateManager()

-- we put out levelstate on top here, but you could create a main menu
--- @diagnostic disable-next-line
function love.load(args)
   manager:push(spectrum.gamestates.GameStartState(display))

   manager:hook({ exclude = { "draw" } })
   spectrum.Input:hook()
   love.window.maximize()
end

function love.draw()
   local zoom = 2.0
   love.graphics.push()
   love.graphics.scale(zoom, zoom)
   manager:emit("draw")
   display:draw()
   love.graphics.pop()
end

-- Automatically size the window to match the terminal dimensions
display:fitWindowToTerminal()

function love.quit()
   if Game.lost then love.filesystem.remove("save.lz4") return end
   local save = Game:serialize()
   local mp = prism.messagepack.pack(save)
   local lz = love.data.compress("string", "lz4", mp)
   love.filesystem.write("save.lz4", lz)
end
