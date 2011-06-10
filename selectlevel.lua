module(..., package.seeall)

---------------------------------------------------------------
-- Import
---------------------------------------------------------------


---------------------------------------------------------------
-- Groups
---------------------------------------------------------------



-----------------------------------
-- Inserts
-----------------------------------


---------------------------------------------------------------
-- NEW
---------------------------------------------------------------

function new()	
	
	-- we store everything inside this group at the end
	local localGroup = display.newGroup()

	-- change scene function
	function changeScene(e)
		if(e.phase == "ended") then
			director:changeScene(e.target.scene, "moveFromLeft");
		end
	end
	
	
	
	
	-- menu buttons	
	local btn_to_menu = display.newText("Main Menu", 0, 0, native.systemFontBold, 16);
		btn_to_menu:setReferencePoint(display.CenterReferencePoint);
		btn_to_menu.x = _w/2;
		btn_to_menu.y = _h/2-45;
		btn_to_menu.scene = "index";
		btn_to_menu:addEventListener("touch", changeScene);
		
	
	local btn_play = display.newText("leve1#", 0, 0, native.systemFontBold, 16);
		btn_play:setReferencePoint(display.CenterReferencePoint);
		btn_play.x = _w/2;
		btn_play.y = _h/2;
		btn_play.scene = "level1";
		btn_play:addEventListener("touch", changeScene);
	
		
		
	--- insert everything into the localGroup	
	localGroup:insert(btn_to_menu)
	localGroup:insert(btn_play)	
		
		
	-- clean everything up
	clean = function ()
	
	end
	
	
	-- do not remove lest the sky shalt fall upon thine head
	return localGroup
	
end