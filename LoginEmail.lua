
-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
-------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImageRect( "menubutton.png", 350 , 600 )
--then center it like below
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		local function textListener( event )
	 		-- User begins editing "defaultField"
		    if ( event.phase == "began" ) then
		        event.target.text = " "
		        event.target: setTextColor( 0,0,0 ) --css rgb color
		 
		    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		        -- Output resulting text from "defaultField"
		        --control = true
		       -- composer.gotoScene( "level2", "fade", 500 )		 
		    elseif ( event.phase == "editing" ) then
		      
		    end
		end
		textBox = native.newTextBox( 160, 240, 280, 140 )
textBox.font = native.newFont( "Helvetica-Bold", 16 )
textBox:setTextColor( 0.8, 0.8, 0.8 )
textBox.hasBackground = false
textBox.text = "Hello, world!"

		local email = display.newText( "Login", 160, 120, "Codystar-Regular.ttf", 40 )
		email:setFillColor(255,255,255 )

		defaultField = native.newTextField(300,300,300,30)
		defaultField:resizeHeightToFitFont()
		defaultField.text = "Qual o email?"
		defaultField:setTextColor( 0.8, 0.8, 0.8 )
		defaultField.x = 165 + display.screenOriginX 
		defaultField.y = 440 + display.screenOriginY
		defaultField:addEventListener( "userInput", textListener )
		local exemplo1 = display.newText( "Exemplo: usuario@exemplo.com",125, 420,native.systemFont, 15  )
		exemplo1:setFillColor(255,255,255 )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene