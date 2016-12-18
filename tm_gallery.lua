local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

function buttonHit(event)
    composer.gotoScene( event.target.goto, {effect = "fade", time = "100"});
    local pageSound = audio.loadSound ( "assets/audio/page.wav")
    audio.play(pageSound);
end


---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

--Audio looping and fading syntax example
--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )

--display gallery backdrop

--local tmback = display.newImage("assets/tm_main/tmback.jpg")
--tmback.alpha = 0.2
--tmback.x = centerX
--tmback.y = centerY
--tmback.width = screenWidth
--tmback.height = screenHeight
--sceneGroup:insert(tmback)

--display books in gallery

local cover1 = display.newImage("assets/tm_main/cover1.jpg")
cover1.alpha = 1
cover1.x = centerX - 300
cover1.y = centerY- 200
cover1:scale( 1.2, 1.2 )
--bg.width = screenWidth
--bg.height = screenHeight
cover1.goto = "tm1_ov"
cover1:addEventListener("tap", buttonHit);
sceneGroup:insert(cover1)

local cover2 = display.newImage("assets/tm_main/cover2.jpg")
cover2.alpha = 1
cover2.x = centerX + 350
cover2.y = centerY- 200
cover2:scale( 1.2, 1.2 )
--bg.width = screenWidth
--bg.height = screenHeight
cover2.goto = "tm2_ov"
cover2:addEventListener("tap", buttonHit);
sceneGroup:insert(cover2)

local cover3 = display.newImage("assets/tm_main/cover3.jpg")
cover3.alpha = 1
cover3.x = centerX + 50
cover3.y = centerY + 250
cover3:scale( 1.2, 1.2 )
--bg.width = screenWidth
--bg.height = screenHeight
cover3.goto = "tm3_ov"
cover3:addEventListener("tap", buttonHit);
sceneGroup:insert(cover3)

end



-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        
    --composer.gotoScene( "", {effect = "crossFade", time = "4500"});
        
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.

        local gal_loop = audio.loadSound ("assets/audio/gallery_loop.mp3")
        audio.play( gal_loop, { loops=-1 } )

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
        
        audio.stop();
        audio.dispose();
        
        
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
    
    composer.removeScene("tm_gallery", false);
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene