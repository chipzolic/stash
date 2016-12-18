local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here


---------------------- Synopsis text -------------------------
local Text = [[Team Muhafiz is a story about nine young lorem ipsum trium. Tasdasd asasd asdasd as asd sfgfdg asdas. kjahdjash  kjahsd jkashd  kashd akjsh asjd askj askjh askdhaskjd askjdah askdj haskjd askjd askjdh askjd askdhaskjdahs kjaskdj askd sakjdh askj haskjd haskjdh askjdh askdj hasjdh askjdh askjdaskdjhaskj dahsdjk.]]
 
local options = {
   text = Text,
   x = display.contentCenterX - 450;
   y = display.contentCenterY + 120,
   width = 900,
   height = 900,
   fontSize = 40,
   align = "left";
}
 
local textField = display.newText( options )
textField:setFillColor( 255, 255, 255 )
textField.alpha = 1;



---------------------- Details text
local d_Text = [[
Universe: Team Muhafiz
Release Date: 15th Jan 2016
Total Books: 10
Genre: Young Adult Fiction
Created By: Azcorp Comics]]
 
local d_options = {
   text = d_Text,
   x = display.contentCenterX - 450,
   y = display.contentCenterY + 120,
   width = 900,
   height = 900,
   fontSize = 40,
   align = "left"
}
 
local d_textField = display.newText( d_options )
d_textField:setFillColor( 255, 255, 255 )
d_textField.alpha = 0;



---------------------- Credits text
local c_Text = [[
Writer: A.Imran Ali
Illustrators: Babrus Khan, Rabya Ali
Colourist: Z.A.Shahid
Editor: U.A.Ubaid
Feedback: listen@azcomics.com]]
 
local c_options = {
   text = c_Text,
   x = display.contentCenterX - 450,
   y = display.contentCenterY + 120,
   width = 900,
   height = 900,
   fontSize = 40,
   align = "left"
}
 
local c_textField = display.newText( c_options )
c_textField:setFillColor( 255, 255, 255 )
c_textField.alpha = 0;



--- Declaring forward references here, these are all the visual assets i'll be using below.
local synr = display.newImage("assets/ui/synrel.png")
local synp = display.newImage("assets/ui/synp.png")
local det = display.newImage("assets/ui/detr.png")
local detp = display.newImage("assets/ui/detp.png")
local cr = display.newImage("assets/ui/crrel.png")
local crp = display.newImage("assets/ui/crp.png")


--- This function deals with page turning scene changes.
function buttonHit(event)
    composer.gotoScene( event.target.goto, {effect = "fade", time = "200"});
    local pageSound = audio.loadSound ( "assets/audio/page.wav")
    audio.play(pageSound);
end


-- This function is for the details UI section
function details(event)
    synp.alpha = 0;
    synr.alpha = 1;
    detp.alpha = 1;
    det.alpha = 0;
    crp.alpha = 0;
    cr.alpha = 1;
    d_textField.alpha = 1;
    textField.alpha = 0;
    c_textField.alpha = 0;
    audio.play(click);
    --local pageSound = audio.loadSound ( "assets/audio/page.wav")
    --audio.play(pageSound);
end


-- This function is for the credits UI section
function credits(event)
    synp.alpha = 0;
    synr.alpha = 1;
    detp.alpha = 0;
    det.alpha = 1;
    crp.alpha = 1;
    cr.alpha = 0;
    d_textField.alpha = 0;
    textField.alpha = 0;
    c_textField.alpha = 1;
    audio.play(click);
    --local pageSound = audio.loadSound ( "assets/audio/page.wav")
    --audio.play(pageSound);
end


-- This function is for the synopsis UI section
function synopsis(event)
    synp.alpha = 1;
    synr.alpha = 0;
    detp.alpha = 0;
    det.alpha = 1;
    crp.alpha = 0;
    cr.alpha = 1;
    d_textField.alpha = 0;
    textField.alpha = 1;
    c_textField.alpha = 0;
    audio.play(click);
    --local pageSound = audio.loadSound ( "assets/audio/page.wav")
    --audio.play(pageSound);
end




---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

--Audio looping and fading syntax example
--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )

sceneGroup:insert(textField)
sceneGroup:insert(d_textField)
sceneGroup:insert(c_textField)

--display comic book cover up front
local covr = display.newImage("assets/tm_main/cover1.jpg")
covr.alpha = 0
covr:scale( 2, 2 )
covr.x = centerX
covr.y = centerY - 170
--tmback.width = screenWidth
--tmback.height = screenHeight
sceneGroup:insert(covr)

---display TEAM MUHAFIZ UNIVERSE logo
local tmlogo = display.newImage("assets/logos/tm/1.png")
tmlogo.alpha = 1
tmlogo:scale( 2, 2 )
tmlogo.x = centerX;
tmlogo.y = centerY - 350
--tmback.width = screenWidth
--tmback.height = screenHeight
sceneGroup:insert(tmlogo)

--display divider line
local line = display.newImage("assets/ui/line1.png")
line.x = centerX 
line.y = centerY - 60
line.alpha = 0.7
line:scale( 2, 2 )
--storep:addEventListener("tap", storeOpen);
sceneGroup:insert(line)

--create READ COMIC button
local read = display.newImage("assets/ui/read.png")
read.x = centerX - 300
read.y = centerY - 180
read.alpha = 1
read:scale( 3, 3 )
read.goto = "scene0_book2"
read:addEventListener("tap", buttonHit);
sceneGroup:insert(read)

--create BUY PRINT button
local buy = display.newImage("assets/ui/buyprint.png")
buy.x = centerX 
buy.y = centerY - 180
buy.alpha = 1
buy:scale( 2, 2 )
--buy:addEventListener("tap", readFunc);
sceneGroup:insert(buy)

--create VISIT WEBSHOP button
local visit = display.newImage("assets/ui/webshop.png")
visit.x = centerX + 300
visit.y = centerY - 180
visit.alpha = 1
visit:scale( 2, 2 )
--visit:addEventListener("tap", readFunc);
sceneGroup:insert(visit)

--create synopsis released button
--local synr = display.newImage("assets/ui/synrel.png")
synr.x = centerX - 300
synr.y = centerY + 35; 
synr.alpha = 0
synr:scale( 2, 2 )
synr:addEventListener("tap", synopsis);
sceneGroup:insert(synr)

--create synopsis pressed button
--local synp = display.newImage("assets/ui/synp.png")
synp.x = centerX - 300
synp.y = centerY + 35;
synp.alpha = 1
synp:scale( 2, 2 )
--synr:addEventListener("tap", synopsis);
sceneGroup:insert(synp)

--create details released button
--local det = display.newImage("assets/ui/detr.png")
det.x = centerX 
det.y = centerY + 35
det.alpha = 1
det:scale( 2, 2 )
det:addEventListener("tap", details);
sceneGroup:insert(det)

--create details pressed button
--local detp = display.newImage("assets/ui/detp.png")
detp.x = centerX 
detp.y = centerY + 35
detp.alpha = 0
detp:scale( 2, 2 )
--detp:addEventListener("tap", details);
sceneGroup:insert(detp)

--create credits released button
--local cr = display.newImage("assets/ui/crrel.png")
cr.x = centerX + 300
cr.y = centerY + 35
cr.alpha = 1
cr:scale( 2, 2 )
cr:addEventListener("tap", credits);
sceneGroup:insert(cr)

--create credits pressed button
--local crp = display.newImage("assets/ui/crp.png")
crp.x = centerX + 300
crp.y = centerY + 35
crp.alpha = 0
crp:scale( 2, 2 )
--crp:addEventListener("tap", credits);
sceneGroup:insert(crp)



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
    
    composer.removeScene("tm2_ov", false);
    
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene