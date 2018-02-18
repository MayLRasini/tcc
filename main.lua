-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
local json = require("json")
local sqlite3 = require( "sqlite3" )
display.setStatusBar( display.HiddenStatusBar )


-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen--

local background = display.newImageRect( "foxInicio.png", 350 , 600 )
--then center it like below
	background.x = display.contentCenterX
	background.y = display.contentCenterY

function showScreen1()
    composer.removeHidden()
    composer.gotoScene( "cadastro", "fade", 1250 )
    return true
end
function showScreen2()
    composer.removeHidden()
    composer.gotoScene( "aggregate", "fade", 250 )
    return true
end
local function closeSplash()
    display.remove( background )
    background = nil
    showScreen1()
end
local function closeSplash2()
    display.remove( background )
    background = nil
    showScreen2()
end

timer.performWithDelay( 2000, closeSplash)


--composer.gotoScene( "inicio" )