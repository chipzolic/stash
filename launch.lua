local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

function buttonHit(event)
    composer.gotoScene( event.target.goto, {effect = "slideUp", time = "100"});
    local pageSound = audio.loadSound ( "assets/audio/page.wav")
    audio.play(pageSound);
end


--[[local listener = {}
function listener:timer( event )
    print( "listener called" )
end--]]

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    
--load and play audio

local music = audio.loadSound ("assets/audio/launch_jingle.mp3")
audio.play(music);

--display company logo

local logo = display.newImage("assets/logos/azcorp/logo.png")
--logo.alpha = 1
logo.x = centerX
logo.y = centerY
--logo:scale( 0.5, 0.5 )
sceneGroup:insert(logo)


end



-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        
    composer.gotoScene( "into_gallery", {effect = "crossFade", time = "1800"});
        
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
        
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
    
    composer.removeScene("launch", false);
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene