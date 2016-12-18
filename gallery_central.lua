local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

local tm_logo = display.newImage("assets/logos/tm/1.png")
local bs_logo = display.newImage("assets/logos/basila/1.png")
local blt_logo = display.newImage("assets/logos/blt/1.png")
local qhr_logo = display.newImage("assets/logos/qhr/1.png")
local jsheeba_logo = display.newImage("assets/logos/jsheeba/1.png")

function buttonHit(event)
    composer.gotoScene( event.target.goto, {effect = "fade", time = "100"});
    local pageSound = audio.loadSound ( "assets/audio/page.wav")
    audio.play(pageSound);
end

-- Comic store function
function comicStore(event)
    storerel.alpha = 0;
    storep.alpha = 1;
    mycp.alpha = 0;
    mycr.alpha = 1;
    tm_logo.alpha = 1;
    bs_logo.alpha = 1;
    blt_logo.alpha = 1;
    qhr_logo.alpha = 1;
    jsheeba_logo.alpha = 1;
    --storeptext.alpha = 1;
    --mycptext.alpha = 1;
    
    --audio.play(click);
end

-- My comics function
function myComics(event)
    mycr.alpha = 0;
    mycp.alpha = 1;
    storep.alpha = 0;
    storerel.alpha = 1;
    tm_logo.alpha = 1;
    bs_logo.alpha = 0;
    blt_logo.alpha = 0;
    qhr_logo.alpha = 0;
    jsheeba_logo.alpha = 0;
    --storeptext.alpha = 1;
    --mycptext.alpha = 1;
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
local splash = display.newImage("assets/splash/horizontal.png")
splash.alpha = 0.1
splash.x = centerX
splash.y = centerY
--splash:scale(0.95, 0.95)
splash.width = screenWidth
splash.height = screenHeight
sceneGroup:insert(splash)

--display comic book logos in gallery
--local tm_logo = display.newImage("assets/logos/tm/1.png")
tm_logo.alpha = 1
tm_logo.x = centerX 
tm_logo.y = centerY - 400
tm_logo:scale( 1.5, 1.5 )
--bg.width = screenWidth
--bg.height = screenHeight
tm_logo.goto = "tm_gallery"
tm_logo:addEventListener("tap", buttonHit);
sceneGroup:insert(tm_logo)

--local bs_logo = display.newImage("assets/logos/basila/1.png")
bs_logo.alpha = 1
bs_logo.x = centerX 
bs_logo.y = centerY - 215
bs_logo:scale( 0.7, 0.7 )
--bg.width = screenWidth
--bg.height = screenHeight
sceneGroup:insert(bs_logo)

--local blt_logo = display.newImage("assets/logos/blt/1.png")
blt_logo.alpha = 1
blt_logo.x = centerX 
blt_logo.y = centerY + 25
blt_logo:scale( 0.7, 0.7 )
--bg.width = screenWidth
--bg.height = screenHeight
sceneGroup:insert(blt_logo)

--local qhr_logo = display.newImage("assets/logos/qhr/1.png")
qhr_logo.alpha = 1
qhr_logo.x = centerX 
qhr_logo.y = centerY + 205
qhr_logo:scale( 0.5, 0.5 )
--bg.width = screenWidth
--bg.height = screenHeight
sceneGroup:insert(qhr_logo)

--local jsheeba_logo = display.newImage("assets/logos/jsheeba/1.png")
jsheeba_logo.alpha = 1
jsheeba_logo.x = centerX 
jsheeba_logo.y = centerY + 405
jsheeba_logo:scale( 0.6, 0.6 )
--bg.width = screenWidth
--bg.height = screenHeight
sceneGroup:insert(jsheeba_logo)


----------------------


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
        
        local gal_loop = audio.loadStream ("assets/audio/gallery_loop.mp3")
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
    
    composer.removeScene("gallery_central", false);
   
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene