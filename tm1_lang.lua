local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

function buttonHit(event)
    composer.gotoScene( event.target.goto, {effect = "fade", time = "500"});
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

local tmback = display.newImage("assets/tm_main/tmback.jpg")
tmback.alpha = 0.2
tmback.x = centerX
tmback.y = centerY
tmback.width = screenWidth
tmback.height = screenHeight
sceneGroup:insert(tmback)

--display language selection text buttons

local font = "HelveticaNeue" or native.systemFont;
local eng = display.newText("English", 0,0,font,100);
eng:setTextColor(220,355,18);
eng.x = centerX;
eng.y = centerY - 150;
eng.goto = "scene1"
eng:addEventListener("tap", buttonHit);
sceneGroup:insert(eng)

local font = "HelveticaNeue" or native.systemFont;
local urd = display.newText("Urdu", 0,0,font,100);
urd:setTextColor(220,455,25);
urd.x = centerX;
urd.y = centerY + 25;
urd.goto = "scene1"
urd:addEventListener("tap", buttonHit);
sceneGroup:insert(urd)


-- Create a comic page

--[[local comix = display.newImage( "book1/pg1p1.png")
--c1_1:scale( 0.8, 0.8 )
comix.x = display.contentCenterX
comix.y = display.contentCenterY
sceneGroup:insert(comix)


--create move forward button

local font = "HelveticaNeue" or native.systemFont;
local txt = display.newText("-->", 0,0,font,58);
txt:setTextColor(240,255,18);
txt.x = centerX + 500;
txt.y = centerY - 500;
txt.goto = "scene2"
txt:addEventListener("tap", buttonHit);
sceneGroup:insert(txt)


---create back button

local font = "HelveticaNeue" or native.systemFont;
local back = display.newText("<--", 0,0,font,58);
back:setTextColor(240,255,18);
back.x = centerX - 500;
back.y = centerY - 500;
back.goto = "gallery"
back:addEventListener("tap",buttonHit);
sceneGroup:insert(back)


---create gallery button

local font = "HelveticaNeue" or native.systemFont;
local gall = display.newText("|||", 0,0,font,58);
gall:setTextColor(240,255,18);
gall.x = centerX - 150;
gall.y = centerY - 500;
gall.goto = "gallery"
gall:addEventListener("tap",buttonHit);
sceneGroup:insert(gall)


--create restart button

local font = "HelveticaNeue" or native.systemFont;
local rego = display.newText("XOX", 0,0,font,58);
rego:setTextColor(240,255,18);
rego.x = centerX;
rego.y = centerY - 500;
rego.goto = "b1pg1p1"
rego:addEventListener("tap",buttonHit);
sceneGroup:insert(rego)--]]


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
    
    composer.removeScene("tm1_lang", false);
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene