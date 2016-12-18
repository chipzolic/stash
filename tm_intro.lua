local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

--local pose2 = display.newImage("assets/tm_main/poses/2.png")
--pose2.alpha = 0

--[[local pose2 = display.newImage("assets/tm_main/poses/2.png")
local pose3 = display.newImage("assets/tm_main/poses/3.png")
local pose4 = display.newImage("assets/tm_main/poses/4.png")
local pose5 = display.newImage("assets/tm_main/poses/5.png")
local pose6 = display.newImage("assets/tm_main/poses/6.png")
local pose7 = display.newImage("assets/tm_main/poses/7.png")
local pose8 = display.newImage("assets/tm_main/poses/8.png")
local pose9 = display.newImage("assets/tm_main/poses/9.png")
local pose10 = display.newImage("assets/tm_main/poses/10.png")
local pose11 = display.newImage("assets/tm_main/poses/11.png")
local pose12 = display.newImage("assets/tm_main/poses/12.png")
local pose13 = display.newImage("assets/tm_main/poses/13.png")
local pose14 = display.newImage("assets/tm_main/poses/14.png")
local pose15 = display.newImage("assets/tm_main/poses/15.png")
local pose16 = display.newImage("assets/tm_main/poses/16.png")
local pose17 = display.newImage("assets/tm_main/poses/17.png")
local pose18 = display.newImage("assets/tm_main/poses/18.png")
local pose19 = display.newImage("assets/tm_main/poses/19.png")
local pose20 = display.newImage("assets/tm_main/poses/20.png")
local pose21 = display.newImage("assets/tm_main/poses/21.png")
local pose22 = display.newImage("assets/tm_main/poses/22.png")
local pose23 = display.newImage("assets/tm_main/poses/23.png")
local pose24 = display.newImage("assets/tm_main/poses/24.png")
local pose25 = display.newImage("assets/tm_main/poses/25.png")--]]



function buttonHit(event)
    composer.gotoScene( event.target.goto, {effect = "fade", time = "500"});
    local pageSound = audio.loadSound ( "assets/audio/p1.wav")
    audio.play(pageSound);
end



local function transition1( event )
    transition.to(pose2, {time=3500, alpha=0, x=display.contentCenterX-750, y=display.contentCenterY-100})
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

--display poses on screen


local function t12( event )
    local pose13 = display.newImage("assets/logos/tm/1.png")
    pose13.alpha = 0
    pose13.x = centerX + 900
    pose13.y = centerY - 2500
    pose13:scale( 1.8, 1.8 )
    sceneGroup:insert(pose13)
    transition.to(pose13, {time=4500, alpha=1, x=display.contentCenterX, y=display.contentCenterY-10})
    --timer.performWithDelay( 2500, t12 ) 
end


local function t11( event )
    local pose12 = display.newImage("assets/tm_main/poses/19.png")
    pose12.alpha = 1
    pose12.x = centerX + 1000
    pose12.y = centerY - 1500
    pose12:scale( 1, 1 )
    sceneGroup:insert(pose12)
    transition.to(pose12, {time=3500, alpha=0, x=display.contentCenterX, y=display.contentCenterY-10})
    timer.performWithDelay( 3500, t12 ) 
end



local function t10( event )
    local pose11 = display.newImage("assets/tm_main/poses/16.png")
    pose11.alpha = 1
    pose11.x = centerX + 1000
    pose11.y = centerY - 1500
    pose11:scale( 1, 1 )
    sceneGroup:insert(pose11)
    transition.to(pose11, {time=6500, alpha=0, x=display.contentCenterX+10, y=display.contentCenterY-50})
    timer.performWithDelay( 1000, t11 ) 
end

local function t9( event )
    local pose10 = display.newImage("assets/tm_main/poses/12.png")
    pose10.alpha = 1
    pose10.x = centerX + 1000
    pose10.y = centerY - 1200
    pose10:scale( 1, 1 )
    sceneGroup:insert(pose10)
    transition.to(pose10, {time=5500, alpha=0, x=display.contentCenterX, y=display.contentCenterY-10})
    timer.performWithDelay( 2000, t10 ) 
end

local function t8( event )
    local pose9 = display.newImage("assets/tm_main/poses/9.png")
    pose9.alpha = 1
    pose9.x = centerX + 1000
    pose9.y = centerY - 1000
    pose9:scale( 1, 1 )
    sceneGroup:insert(pose9)
    transition.to(pose9, {time=5500, alpha=0, x=display.contentCenterX, y=display.contentCenterY-50})
    timer.performWithDelay( 2500, t9 ) 
end


local function t7( event )
    local pose8 = display.newImage("assets/tm_main/poses/8.png")
    pose8.alpha = 1
    pose8.x = centerX + 1000
    pose8.y = centerY - 1000
    pose8:scale( 1, 1 )
    sceneGroup:insert(pose8)
    transition.to(pose8, {time=2500, alpha=0, x=display.contentCenterX, y=display.contentCenterY-10})
    timer.performWithDelay( 2000, t8 ) 
end


local function t6( event )
    local pose7 = display.newImage("assets/tm_main/poses/7.png")
    pose7.alpha = 1
    pose7.x = centerX + 1000
    pose7.y = centerY + 1000
    pose7:scale( 1, 1 )
    sceneGroup:insert(pose7)
    transition.to(pose7, {time=3500, alpha=0, x=display.contentCenterX-150, y=display.contentCenterY-20})
    timer.performWithDelay( 1000, t7 ) 
end


local function t5( event )
    local pose6 = display.newImage("assets/tm_main/poses/6.png")
    pose6.alpha = 1
    pose6.x = centerX + 1000
    pose6.y = centerY + 1000
    pose6:scale( 1, 1 )
    sceneGroup:insert(pose6)
    transition.to(pose6, {time=3500, alpha=0, x=display.contentCenterX-250, y=display.contentCenterY-50})
    timer.performWithDelay( 2000, t6 ) 
end


local function t4( event )
    local pose5 = display.newImage("assets/tm_main/poses/5.png")
    pose5.alpha = 1
    pose5.x = centerX + 1000
    pose5.y = centerY + 1000
    pose5:scale( 1, 1 )
    sceneGroup:insert(pose5)
    transition.to(pose5, {time=5500, alpha=0, x=display.contentCenterX-250, y=display.contentCenterY-50})
    timer.performWithDelay( 2000, t5 ) 
end


local function t3( event )
    local pose4 = display.newImage("assets/tm_main/poses/4.png")
    pose4.alpha = 1
    pose4.x = centerX - 1000
    pose4.y = centerY + 1000
    pose4:scale( 1, 1 )
    sceneGroup:insert(pose4)
    transition.to(pose4, {time=5500, alpha=0, x=display.contentCenterX-350, y=display.contentCenterY-100})
    timer.performWithDelay( 2000, t4 ) 
end


local function t2( event )
    local pose3 = display.newImage("assets/tm_main/poses/3.png")
    pose3.alpha = 1
    pose3.x = centerX + 1000
    pose3.y = centerY + 1000
    pose3:scale( 1, 1 )
    sceneGroup:insert(pose3)
    transition.to(pose3, {time=5500, alpha=0, x=display.contentCenterX-750, y=display.contentCenterY-200})
    timer.performWithDelay( 2000, t3 )
    --onComplete=t3() 
end


local function t1( event )
    local pose2 = display.newImage("assets/tm_main/poses/2.png")
    pose2.alpha = 1
    pose2.x = centerX + 1000
    pose2.y = centerY + 1000
    pose2:scale( 1, 1 )
    sceneGroup:insert(pose2)
    transition.to(pose2, {time=3500, alpha=0, x=display.contentCenterX-750, y=display.contentCenterY-100})
    --onComplete=t2()
    timer.performWithDelay( 2000, t2 )
end



local pose1 = display.newImage("assets/tm_main/poses/1.png")
pose1.alpha = 1
pose1.x = centerX 
pose1.y = centerY 
pose1:scale( 1, 1 )
transition.to(pose1, {time=3500, alpha=0, x=display.contentCenterX-350, y=display.contentCenterY})
sceneGroup:insert(pose1)
onComplete=t1() 


local bg = display.newImage("assets/tm_main/tmback.jpg")
bg.alpha = 0.2
bg.x = centerX 
bg.y = centerY 
bg:scale( 1.9, 1.9 )
transition.to(bg, {time=60000, alpha=0, x=display.contentCenterX-1000, y=display.contentCenterY})
sceneGroup:insert(bg)
--onComplete=t1() 











--create SKIP button

local font = "HelveticaNeue" or native.systemFont;
local txt = display.newText("SKIP", 0,0,font,58);
txt:setTextColor(240,255,18);
txt.x = centerX + 450;
txt.y = centerY - 800;
txt.goto = "tm1_lang"
txt:addEventListener("tap", buttonHit);
sceneGroup:insert(txt)



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

        local intromusic = audio.loadSound ("assets/tm_main/raven.mp3")
        audio.play( intromusic, { loops=-1 } )

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
    
    composer.removeScene("tm_intro", false);
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene