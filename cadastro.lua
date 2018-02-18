-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"


function scene:create( event )
	local sceneGroup = self.view

	
	local background = display.newImageRect( "menubutton.png", 350 , 600 )
--then center it like below
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local googleSignIn = require "plugin.googleSignIn"
	local json = require("json")
	googleSignIn.init()
	local widget = require("widget")
	local androidClientID = "replace with client id (android)"
	local clientID = "replace with client id (iOS)" -- iOS deafult
	if (system.getInfo("platform") == "android") then
	    clientID = androidClientID
	end

	local title = display.newText( "Login", 160, 120, "Codystar-Regular.ttf", 40 )
	title:setFillColor(255,255,255 )

	local signIn = widget.newButton( {
		defaultFile = "googlebutton.png",
        overFile =  "googlebutton.png",
        width = 310,
        height = 150,
		x = display.contentCenterX,
		--y = display.contentCenterY,
		onRelease = function ( e )
	        googleSignIn.signIn(clientID, nil,nil,function ( ev )
	            if (ev.isError == true) then
	                native.showAlert("Error Sign In", ev.error, {"Ok"})
	            else
	                native.showAlert("Signed In", json.encode(ev), {"Ok"})
	            end
			end)
		end,
	} )
	signIn.y = display.contentHeight - 210


	local signInEmail = widget.newButton( {
		defaultFile = "emailbutton.png",
        overFile =  "emailbutton.png",
        width = 310,
        height = 150,
		x = display.contentCenterX,
		--y = display.contentCenterY,
		onRelease = function ( e )
			composer.removeHidden()
    		composer.gotoScene( "LoginEmail", "fade", 1250 )
			-- body
		end
	} )
	signInEmail.y = display.contentHeight - 100
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
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
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene