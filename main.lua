local composer = require( "composer" )

display.setStatusBar(display.HiddenStatusBar)

-- most commonly used screen coordinates

centerX = display.contentCenterX
centerY = display.contentCenterY
screenLeft = display.screenOriginX
screenWidth = display.contentWidth - screenLeft * 2
screenRight = screenLeft + screenWidth
screenTop = display.screenOriginY
screenHeight = display.contentHeight - screenTop * 2
screenBottom = screenTop + screenHeight
display.contentWidth = screenWidth
display.contentHeight = screenHeight

click = audio.loadSound ("assets/audio/click.ogg")
pageSound = audio.loadSound ("assets/audio/p1.wav")

composer.gotoScene( "launch" )


