module(..., package.seeall)


function new()	
	
	-- we store everything inside this group at the end
	local localGroup = display.newGroup()		
	
	-- change scene function
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene, "moveFromRight");
		end
	end
		
	
	
	-- load cms site
	local function visitSite(e)
		system.openURL( "http://www.cornstarchmonsters.com" )
	end
	
	-- menu buttons	
	local btn_play = display.newText("Play", 0, 0, native.systemFontBold, 16);
		btn_play:setReferencePoint(display.CenterReferencePoint);
		btn_play.x = _w/2;
		btn_play.y = _h/2-45;
		btn_play.scene = "selectlevel";
		btn_play:addEventListener("touch", changeScene);
	
	local btn_exit = display.newText("Exit", 0, 0, native.systemFontBold, 16);
		btn_exit:setReferencePoint(display.CenterReferencePoint);
		btn_exit.x = _w/2;
		btn_exit.y = _h/2;
		btn_exit.scene = "exit";
		btn_exit:addEventListener("touch", changeScene);
		
	local btn_apps = display.newText("Our Other Apps", 0, 0, native.systemFontBold, 16);
		btn_apps:setReferencePoint(display.CenterReferencePoint);
		btn_apps.x = _w/2;
		btn_apps.y = _h/2+45;
		btn_apps.scene = "apps";
		btn_apps:addEventListener("touch", visitSite);
	
		
		
	--- insert everything into the localGroup	
	localGroup:insert(btn_play)
	localGroup:insert(btn_exit)
	localGroup:insert(btn_apps)	
	
	
	-- clean everything up
	clean = function ()
	
	end
	
	-- do not remove lest the sky shalt fall upon thine head
	return localGroup
	
end