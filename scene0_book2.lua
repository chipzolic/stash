local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- This function is for transitioning to the next scene.
function forward(event)
    composer.gotoScene(event.target.goto, {effect = "slideLeft", time = "500"});
    audio.play(pageSound);
end

--This function leads from the first comic page, back to the book gallery of the app.
function backward(event)
    composer.gotoScene(event.target.goto, {effect = "slideRight", time = "500"});
    audio.play(pageSound);
end


---------------------------------------------------------------------------------


-- "scene:create()"

function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

    
-- Create background

local bg = display.newImage("assets/tm_main/tmback.jpg")
--bg:toBack()
bg.alpha = 0.1
bg.x = centerX
bg.y = centerY
bg.width = screenWidth
bg.height = screenHeight
sceneGroup:insert(bg)

-- Create the comic page for this scene

local comix = display.newImage("proassets/issue2/eng/1.png")
comix:scale( 0.75, 0.75 )
comix.x = display.contentCenterX 
comix.y = display.contentCenterY
comix.alpha = 1
comix.rotation = 0
sceneGroup:insert(comix)

-- Create nextpage button to move to next page in the scene

local nextpage = display.newImage("assets/ui/arrow.png")
nextpage:scale( 1, 1 )
nextpage.x = centerX + 650;
nextpage.y = centerY + 400;
nextpage.goto = "scene1_book2"
nextpage.alpha = 0.8
nextpage.rotation = 0
nextpage:addEventListener("tap", forward);
sceneGroup:insert(nextpage)

-- Create back buttons

local backpage = display.newImage("assets/ui/arrow.png")
backpage:scale( 1, 1 )
backpage.x = centerX - 650;
backpage.y = centerY - 400;
backpage.alpha = 0.8
backpage.rotation = -180
backpage.goto = "tm2_ov"
backpage:addEventListener("tap", backward);
sceneGroup:insert(backpage)


end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
        
        --local gal_loop = audio.loadSound ("assets/audio/gallery_loop.mp3")
        --audio.play( gal_loop, { loops=-1 } )
        
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
    
     composer.removeScene("scene0_book2", false);
     
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene