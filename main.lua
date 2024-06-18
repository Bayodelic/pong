-- https://github.com/Ulydev/push
push = require 'push'

-- Values of screen and virtual screen
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[
    Runs when the game first starts up, only once; used to initialize the game.
]]
function love.load()
    -- Use nearest-neighbor filtering on upscaling and downscaling to prevent blurring of text 
    -- and graphics
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Retro font object
    retroFont = love.graphics.newFont('font.ttf', 8)
    -- Set the new font
    love.graphics.setFont(retroFont)

    -- Initialize our virtual resolution, which will be rendered within our
    -- actual window no matter its dimensions
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Keyboard handling, called by LÖVE2D each frame; 
    passes in the key we pressed so we can access.
]]
function love.keypressed(key)
    -- Keys can be accessed by string name
    if key == 'escape' then
        -- Function LÖVE gives us to terminate application
        love.event.quit()
    end
end

function love.draw()
    -- Begin rendering at virtual resolution
    push:apply('start')

    --clear the screen with a specific color
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)    -- Condensed onto one line from last example
    -- Note we are now using virtual width and height now for text placement
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    --firt paddle
    love.graphics.rectangle('fill',10,30,5,20)

    --second paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH-10, VIRTUAL_HEIGHT-50,5,20)

    --ball
    love.graphics.rectangle('fill',VIRTUAL_WIDTH/2,VIRTUAL_HEIGHT/2,4,4)
    -- End rendering at virtual resolution
    push:apply('end')
end
