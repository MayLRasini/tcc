-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

local play
local config
local store

local function onPlayRelease()
	
	-- go to level1.lua scene
	--composer.gotoScene( "level1", "fade", 500 )
	print("play")
	
	return true	-- indicates successful touch

end

local function onconfigRelease()
	
	-- go to level1.lua scene
	--composer.gotoScene( "level1", "fade", 500 )
	print("config")
	
	return true	-- indicates successful touch
end

local function onstoreRelease()
	
	-- go to level1.lua scene
	--composer.gotoScene( "level1", "fade", 500 )
	print("store")
	
	return true	-- indicates successful touch
end

local function onExitRelease()
	
	-- go to level1.lua scene
	--composer.gotoScene( "level1", "fade", 500 )
	print("exit")
	
	return true	-- indicates successful touch
end
--------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	
	
	local background = display.newImageRect( "menubutton.png", 350 , 600 )
--then center it like below
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newText( "Menu", 150, 100, "Codystar-Regular.ttf", 50 )
	title:setFillColor(255,255,255 )

	play = widget.newButton{
		--label="Play Now",
		--labelColor = { default={0}, over={128} },
		--default="button.jpg",
		--over="button-over.jpg",
		--width=154, height=40,
		width = 290,
        height = 130,
        defaultFile = "jogarbutton.png",
        overFile =  "jogarbutton.png",
        --label = "button",
        --labelColor = { default={0}, over={128} },
		onEvent = onPlayRelease	-- event listener function
	}

	play.x = display.contentCenterX
	play.y = display.contentHeight - 295

	config = widget.newButton{
		--label="config Now",
		--labelColor = { default={0}, over={128} },
		--default="button.jpg",
		--over="button-over.jpg",
		--width=154, height=40,
		width = 290,
        height = 130,
        defaultFile = "configbutton.png",
        overFile =  "configbutton.png",
        --label = "button",
        --labelColor = { default={0}, over={128} },
		onEvent = onconfigRelease	-- event listener function
	}

	config.x = display.contentCenterX
	config.y = display.contentHeight - 210

	loja = widget.newButton{
		--label="loja Now",
		--labelColor = { default={0}, over={128} },
		--default="button.jpg",
		--over="button-over.jpg",
		--width=154, height=40,
		width = 290,
        height = 130,
        defaultFile = "lojabutton.png",
        overFile =  "lojabutton.png",
        --label = "button",
        --labelColor = { default={0}, over={128} },
		onEvent = onstoreRelease	-- event listener function
	}

	loja.x = display.contentCenterX
	loja.y = display.contentHeight - 125

	sair = widget.newButton{
		--label="sair Now",
		--labelColor = { default={0}, over={128} },
		--default="button.jpg",
		--over="button-over.jpg",
		--width=154, height=40,
		width = 290,
        height = 130,
        defaultFile = "sairbutton.png",
        overFile =  "sairbutton.png",
        --label = "button",
        --labelColor = { default={0}, over={128} },
		onEvent = onExitRelease	-- event listener function
	}

	sair.x = display.contentCenterX
	sair.y = display.contentHeight -40

	--sceneGroup:insert( background )
	--sceneGroup:insert( titleLogo )
	--sceneGroup:insert( play )
	


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