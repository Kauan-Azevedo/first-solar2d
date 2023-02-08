-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
local physics = require("physics")
physics.start()

local tapCount = 0

local background = display.newImageRect("./images/background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local tapText = display.newText(tapCount, display.contentCenterX, 20, native.systemFont, 40)

local plataform = display.newImageRect("./images/platform.png", 300, 50)
plataform.x = display.contentCenterX
plataform.y = display.contentHeight - 25
physics.addBody(plataform, 'static')

local balloon = display.newImageRect("./images/balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
physics.addBody(balloon, 'dynamic', {
    radius = 50,
    bounce = 0.3
})

local function pushBalloon()
    balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
    tapCount = tapCount + 1
    tapText.text = tapCount
end
balloon:addEventListener("tap", pushBalloon)
