-- 
-- Abstract: Ghosts Vs Monsters sample project 
-- Designed and created by Jonathan and Biffy Beebe of Beebe Games exclusively for Ansca, Inc.
-- http://beebegamesonline.appspot.com/

-- (This is easiest to play on iPad or other large devices, but should work on all iOS and Android devices)
-- 
-- Version: 1.1
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

module(..., package.seeall)

-- Main function - MUST return a display.newGroup()
function new()
	local localGroup = display.newGroup()
	
	local path = system.pathForFile( "loadlast.txt", system.DocumentsDirectory )
	local file = io.open( path, "r" )
	if file then -- nil if no file found
	   return_to = file:read( "*a" )
	   print(return_to)
	   io.close(file)
	end
	
	local theTimer
	local loadingImage
	
	local showLoadingScreen = function()
		loadingImage = display.newImageRect( "loading.png", 301, 255 )
		loadingImage.x = _w/2; loadingImage.y = _h/2
		
		local goToLevel = function()
			director:changeScene( return_to )
		end
		
		theTimer = timer.performWithDelay( 2000, goToLevel, 1 )
	end
	
	showLoadingScreen()
	
	clean = function()
		if theTimer then timer.cancel( theTimer ); end
		
		if loadingImage then
			--loadingImage:removeSelf()
			display.remove( loadingImage )
			loadingImage = nil
		end
	end
	
	-- MUST return a display.newGroup()
	return localGroup
end
