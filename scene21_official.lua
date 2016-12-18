local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

local comix1 = display.newImage("proassets/issue1/eng/24.png")
local comix1full = display.newImage("proassets/issue1/eng/24.png")


local nextpage1 = display.newImage("assets/ui/arrow.png")
local nextpage2 = display.newImage("assets/ui/arrow.png")
local nextpage3 = display.newImage("assets/ui/arrow.png")
local nextpage4 = display.newImage("assets/ui/arrow.png")
local next_scene = display.newImage("assets/ui/arrow.png")


local backpage1 = display.newImage("assets/ui/arrow.png")
local backpage2 = display.newImage("assets/ui/arrow.png")
local backpage3 = display.newImage("assets/ui/arrow.png")
local backpage4 = display.newImage("assets/ui/arrow.png")
local backpage_previous = display.newImage("assets/ui/arrow.png")

-- Local forward references should go here

-- This fuction is for panning accross current scene.


function go0()
    transition.to(comix1, {time=500, alpha=1, x=display.contentCenterX+350, y=display.contentCenterY+450})
    --comix1:scale( 3.9, 3.9 )
    nextpage1.alpha = 1;
    nextpage2.alpha = 0;
    nextpage3.alpha = 0;
    nextpage4.alpha = 0;
    next_scene.alpha = 0;
    backpage_previous.alpha = 1;
    backpage1.alpha = 0;
    backpage2.alpha = 0;
    backpage3.alpha = 0;
    backpage4.alpha = 0;
    comix1full.alpha = 0;
end


function go1()
    transition.to(comix1, {time=500, alpha=1, x=display.contentCenterX-350, y=display.contentCenterY+450})
    --comix1:scale( 3.9, 3.9 )
    nextpage1.alpha = 0;
    nextpage2.alpha = 1;
    nextpage3.alpha = 0;
    nextpage4.alpha = 0;
    next_scene.alpha = 0;
    backpage_previous.alpha = 0;
    backpage1.alpha = 1;
    backpage2.alpha = 0;
    backpage3.alpha = 0;
    backpage4.alpha = 0;
    comix1full.alpha = 0;
end


function go2()
    transition.to(comix1, {time=500, alpha=1, x=display.contentCenterX+500, y=display.contentCenterY-500})
    --comix1:scale( 3.9, 3.9 )
    --comix1:scale( 1.0, 1.0 )
    nextpage1.alpha = 0;
    nextpage2.alpha = 0;
    nextpage3.alpha = 1;
    nextpage4.alpha = 0;
    next_scene.alpha = 0;
    backpage_previous.alpha = 0;
    backpage1.alpha = 0;
    backpage2.alpha = 1;
    backpage3.alpha = 0;
    backpage4.alpha = 0;
    comix1full.alpha = 0;
end


function go3()
    transition.to(comix1, {time=500, alpha=1, x=display.contentCenterX-550, y=display.contentCenterY-500})
    --comix1:scale( 3.9, 3.9 )
    nextpage1.alpha = 0;
    nextpage2.alpha = 0;
    nextpage3.alpha = 0;
    nextpage4.alpha = 1;
    next_scene.alpha = 0;
    backpage_previous.alpha = 0;
    backpage1.alpha = 0;
    backpage2.alpha = 0;
    backpage3.alpha = 1;
    backpage4.alpha = 0;
    comix1full.alpha = 0;
end


function go4()
    --transition.to(comix1, {time=500, alpha=1, x=display.contentCenterX, y=display.contentCenterY})
    --comix1:scale( 1, 1 )
    --comix1:scale(0.5, 0.5)
    nextpage1.alpha = 0;
    nextpage2.alpha = 0;
    nextpage3.alpha = 0;
    nextpage4.alpha = 0;
    next_scene.alpha = 1;
    backpage_previous.alpha = 0;
    backpage1.alpha = 0;
    backpage2.alpha = 0;
    backpage3.alpha = 0;
    backpage4.alpha = 1;
    comix1.alpha = 0;
    comix1full.alpha = 1;
    --comix1full:scale(0.5 , 0.5)
end


--This function is for transitioning to the next scene.
function pagefinal(event)
    composer.gotoScene(event.target.goto, {effect = "zoomInOut", time = "1000"});
    audio.play(pageSound);
end

--This function leads from the first comic page, back to the book gallery of the app.
function backtogal(event)
    composer.gotoScene(event.target.goto, {effect = "slideLeft", time = "500"});
    backpage1.alpha = 0;
    audio.play(pageSound);
end

--Red button function for going back to relevant menu.
function red_func(event)
    composer.gotoScene(event.target.goto, {effect = "slideLeft", time = "500"});
    audio.play(pageSound);
end

--This function leads to the previous page.
function backtoprevious(event)
    composer.gotoScene(event.target.goto, {effect = "slideLeft", time = "500"});
    --backpage1.alpha = 0;
    audio.play(pageSound);
end


---------------------------------------------------------------------------------


-- "scene:create()"

function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

    
--create background

local bg = display.newImage("assets/tm_main/tmback.jpg")
--bg:toBack()
bg.alpha = 0.1
bg.x = centerX
bg.y = centerY
bg.width = screenWidth
bg.height = screenHeight
sceneGroup:insert(bg)


-- Create the comic pages for this scene.

--local comix1 = display.newImage( "assets/tm_main/book1eng/pg1a.png")
comix1:scale( 1.5, 1.5 )
comix1.x = display.contentCenterX + 350
comix1.y = display.contentCenterY + 450
comix1.alpha = 1
--bg.width = screenWidth
--bg.height = screenHeight
--comix1.rotation = 90
sceneGroup:insert(comix1)


--This is the full sized comic page to show at the very end
comix1full:scale( 0.8, 0.8 )
comix1full.x = display.contentCenterX 
comix1full.y = display.contentCenterY 
comix1full.alpha = 0
--bg.width = screenWidth
--bg.height = screenHeight
--comix1.rotation = 90
sceneGroup:insert(comix1full)


-- Create the red menu button
local red = display.newImage("assets/ui/redpro.png")
red:scale( 0.2, 0.2 )
red.x = centerX + 900;
red.y = centerY - 475;
red.goto = "tm_gallery"
red.alpha = 1
--red.rotation = 90
red:addEventListener("tap", red_func);
sceneGroup:insert(red)


--create nextpage button to move to next page within the scene.
--local nextpage1 = display.newImage("assets/ui/arrow.png")
nextpage1:scale( 0.8, 0.8 )
nextpage1.x = centerX + 700;
nextpage1.y = centerY + 450;
--nextpage1.goto = "scene2"
nextpage1.alpha = 1
--nextpage1.rotation = 90
nextpage1:addEventListener("tap", go1);
sceneGroup:insert(nextpage1)

nextpage2:scale( 0.8, 0.8 )
nextpage2.x = centerX + 700;
nextpage2.y = centerY + 450;
--nextpage2.goto = "scene2"
nextpage2.alpha = 0
--nextpage1.rotation = 90
nextpage2:addEventListener("tap", go2);
sceneGroup:insert(nextpage2)

nextpage3:scale( 0.8, 0.8 )
nextpage3.x = centerX + 700;
nextpage3.y = centerY + 450;
--nextpage1.goto = "scene2"
nextpage3.alpha = 0
--nextpage1.rotation = 90
nextpage3:addEventListener("tap", go3);
sceneGroup:insert(nextpage1)

nextpage4:scale( 0.8, 0.8 )
nextpage4.x = centerX + 700;
nextpage4.y = centerY + 450;
--nextpage4.goto = "scene2gv"
nextpage4.alpha = 0
--nextpage1.rotation = 90
nextpage4:addEventListener("tap", go4);
sceneGroup:insert(nextpage4)

next_scene:scale( 0.8, 0.8 )
next_scene.x = centerX + 700;
next_scene.y = centerY + 450;
next_scene.goto = "scene22_official"
next_scene.alpha = 0
--nextscene.rotation = 90
next_scene:addEventListener("tap", pagefinal);
sceneGroup:insert(next_scene)


---------- create back buttons
--local backpage1 = display.newImage("assets/ui/arrow.png")
backpage1:scale( 0.8, 0.8 )
backpage1.x = centerX - 700;
backpage1.y = centerY + 430;
backpage1.alpha = 0
backpage1.rotation = -180
--backpage1.goto = "tm_gallery"
backpage1:addEventListener("tap", go0);
sceneGroup:insert(backpage1)

backpage2:scale( 0.8, 0.8 )
backpage2.x = centerX - 700;
backpage2.y = centerY + 430;
backpage2.alpha = 0
backpage2.rotation = -180
--backpage2.goto = "tm_gallery"
backpage2:addEventListener("tap", go1);
sceneGroup:insert(backpage2)

backpage3:scale( 0.8, 0.8 )
backpage3.x = centerX - 700;
backpage3.y = centerY + 430;
backpage3.alpha = 0
backpage3.rotation = -180
--backpage1.goto = "tm_gallery"
backpage3:addEventListener("tap", go2);
sceneGroup:insert(backpage3)

backpage4:scale( 0.8, 0.8 )
backpage4.x = centerX - 700;
backpage4.y = centerY + 430;
backpage4.alpha = 0
backpage4.rotation = -180
--backpage1.goto = "tm_gallery"
backpage4:addEventListener("tap", go3);
sceneGroup:insert(backpage4)

backpage_previous:scale( 0.8, 0.8 )
backpage_previous.x = centerX - 700;
backpage_previous.y = centerY + 430;
backpage_previous.alpha = 0
backpage_previous.rotation = -180
backpage_previous.goto = "scene20_official"
backpage_previous:addEventListener("tap", backtoprevious);
sceneGroup:insert(backpage_previous)


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
        
        --local sfx = audio.loadSound ("assets/audio/city.wav")
        --audio.play( sfx, { loops=-1 } )
        
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
    
     composer.removeScene("scene21_official", false);
     
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene