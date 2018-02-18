-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )


-- include the Corona "composer" module
local composer = require "composer"
local scene = composer.newScene()
local widget = require "widget"

function scene:create( event )
	local sceneGroup = self.view

	local back =  display.newImageRect( "foxInicio.png", 370, 600)
	back.x = 160+display.screenOriginX 
	back.y = 220+display.screenOriginY

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	local function listener( event )
		local bk = display.newImageRect( "back.png", 370, 600)
		bk.alpha = 0
		transition.fadeIn( bk, { time=1000 } )

	   composer.gotoScene( "menu" )
	end
	  
	timer.performWithDelay( 3000, listener )
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene