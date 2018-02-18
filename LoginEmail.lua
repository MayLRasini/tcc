
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
	 		-- User begins editing "email"
		    if ( event.phase == "began" ) then
		        event.target.text = " "
		        event.target: setTextColor( 0,0,0 ) --css rgb color
		 
		    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		    	local emailUser = (event.target.text)	 
		    elseif ( event.phase == "editing" ) then

		      
		    end
		end
		local function textListenerpass( event )
	 		-- User begins editing "email"
		    if ( event.phase == "began" ) then
		        event.target.text = " "
		        event.target: setTextColor( 0,0,0 ) --css rgb color
		 
		    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		    	local emailUser = (event.target.text)	 
		    elseif ( event.phase == "editing" ) then

		      
		    end
		end

		local login = display.newText( "Login", 160, 120, "Codystar-Regular.ttf", 40 )
		login:setFillColor(255,255,255 )

		local emailLabel = display.newText( "Email", 160, 235, "Codystar-Regular.ttf", 30 )
		emailLabel:setFillColor(255,255,255 )

		local email = native.newTextField(300,300,300,30)
		email:resizeHeightToFitFont()
		email.text = "E-mail"
		email:setTextColor( 0.8, 0.8, 0.8 )
		email.x = 165 + display.screenOriginX 
		email.y = 320 + display.screenOriginY
		email:addEventListener( "userInput", textListener )
		local exemplo1 = display.newText( "Exemplo: usuario@exemplo.com",125, 298,native.systemFont, 15  )
		exemplo1:setFillColor(255,255,255 )


		local PasswLabel = display.newText( "Senha", 160, 355, "Codystar-Regular.ttf", 30 )
		PasswLabel:setFillColor(255,255,255 )
		local passW = native.newTextField(300,300,300,30)
		passW:resizeHeightToFitFont()
		passW.text = "Senha"
		passW:setTextColor( 0.8, 0.8, 0.8 )
		passW.x = 165 + display.screenOriginX 
		passW.y = 440 + display.screenOriginY
		passW:addEventListener( "userInput", textListenerpass )
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