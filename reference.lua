local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- local forward references should go here --



function buttonHit(event)
    storyboard.gotoScene( event.target.goto, {effect = "slideUp", time = "1300"});
    local pageSound = audio.loadSound ( "audio/page.wav")
    audio.play(pageSound);
end
    


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
    
--create background

local bg = display.newImage("images/tm.jpg")
--bg:toBack()
bg.alpha = 0.2
bg.x = centerX
bg.y = centerY
bg.width = screenWidth
bg.height = screenHeight
group:insert(bg)


-- Create a comic page

local comix = display.newImage( "gview/b1pg1p1.png")
--c1_1:scale( 0.8, 0.8 )
comix.x = display.contentCenterX
comix.y = display.contentCenterY
group:insert(comix)


--create move forward button

local font = "HelveticaNeue" or native.systemFont;
local txt = display.newText("-->", 0,0,font,58);
txt:setTextColor(240,255,18);
txt.x = centerX + 500;
txt.y = centerY - 500;
txt.goto = "b1pg1p2"
txt:addEventListener("tap", buttonHit);
group:insert(txt)


---create back button

local font = "HelveticaNeue" or native.systemFont;
local back = display.newText("<--", 0,0,font,58);
back:setTextColor(240,255,18);
back.x = centerX - 500;
back.y = centerY - 500;
back.goto = "gallery"
back:addEventListener("tap",buttonHit);
group:insert(back)


---create gallery button

local font = "HelveticaNeue" or native.systemFont;
local gall = display.newText("|||", 0,0,font,58);
gall:setTextColor(240,255,18);
gall.x = centerX - 150;
gall.y = centerY - 500;
gall.goto = "gallery"
gall:addEventListener("tap",buttonHit);
group:insert(gall)


---create restart button

local font = "HelveticaNeue" or native.systemFont;
local rego = display.newText("XOX", 0,0,font,58);
rego:setTextColor(240,255,18);
rego.x = centerX;
rego.y = centerY - 500;
rego.goto = "b1pg1p1"
rego:addEventListener("tap",buttonHit);
group:insert(rego)

	-- CREATE display objects and add them to 'group' here.
	-- Example use-case: Restore 'group' from previously saved state.

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view

	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks

end



---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )


---------------------------------------------------------------------------------

return scene