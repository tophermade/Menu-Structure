module(..., package.seeall)


function new()	
	level_name = "Friendly Level Name"
	level_id = "level1" --should match lua file
	
	-- we store everything inside this group at the end
	local localGroup = display.newGroup()		
	
	-- change scene function
	function changeScene(e)
		if(e.phase == "ended") then
		
			local path = system.pathForFile( "loadlast.txt", system.DocumentsDirectory )
 
			-- io.open opens a file at path. returns nil if no file found
			local file = io.open( path, "r" )
			if file then
			   file = io.open( path, "w" )
			   file:write(level_id)
			   io.close( file )
			else
			   -- create file b/c it doesn't exist yet
			   file = io.open( path, "w" )
			   file:write(level_id)
			   io.close( file )
			end
		
			director:changeScene(e.target.scene, "moveFromRight");
		end
	end
	
----
	-- we want the game object to be available here
	-- level & game code
----	
	game = require("game")
	
	

	
----
	-- //we want the game object to be available here
	-- //level & game code
----		
	
	-- pop up menu with options to reset, load main menu, etc
	local level_menu = display.newGroup()
		level_menu:setReferencePoint(display.CenterReferencePoint);
		level_menu.alpha = 0;
		
		
	-- pop menu function
	function popMenu(e)
		-- you'll want to freeze everything ...
		
		-- and then load the pop 
		transition.to(level_menu, {delay=200, time=500, alpha=1});	
	end	
		
	-- close the menu if unpausing
	function closeMenu(e)
		transition.to(level_menu, {delay=200, time=500, alpha=0});	
	end
	
	local btn_level_menu = display.newText("Level Options", 0, 0, native.systemFontBold, 16);
		btn_level_menu:setReferencePoint(display.CenterReferencePoint);
		btn_level_menu.x = _w/2;
		btn_level_menu.y = _h-45;
		btn_level_menu.scene = "apps";
		btn_level_menu:addEventListener("touch", popMenu);	
		
	local black_out = display.newRect(0,0,_w,_h);	
		black_out:setFillColor(0,0,0);
		black_out.alpha = .8;
		level_menu:insert(black_out);

	local level_menu_bg = display.newRect(_w/4,_h/4,_w/2,_h/2);
		level_menu_bg:setReferencePoint(display.CenterReferencePoint);
		level_menu_bg:setFillColor(67,67,67);
		level_menu:insert(level_menu_bg);
	
	local level_menu_btn_main = display.newText("Return to Menu", 0, 0, native.systemFontBold, 16);
		level_menu_btn_main:setReferencePoint(display.CenterReferencePoint);
		level_menu_btn_main.x = _w/2;
		level_menu_btn_main.y = _h/2-45;
		level_menu_btn_main.scene = "index";
		level_menu:insert(level_menu_btn_main);
		level_menu_btn_main:addEventListener("touch", changeScene);
	
	local level_menu_btn_reset = display.newText("Restart Level", 0, 0, native.systemFontBold, 16);
		level_menu_btn_reset:setReferencePoint(display.CenterReferencePoint);
		level_menu_btn_reset.x = _w/2;
		level_menu_btn_reset.y = _h/2;
		level_menu_btn_reset.scene = "reloader";
		level_menu:insert(level_menu_btn_reset);
		level_menu_btn_reset:addEventListener("touch", changeScene);			
		
	local level_menu_btn_play = display.newText("Continue Playing", 0, 0, native.systemFontBold, 16);
		level_menu_btn_play:setReferencePoint(display.CenterReferencePoint);
		level_menu_btn_play.x = _w/2;
		level_menu_btn_play.y = _h/2+45;
		level_menu:insert(level_menu_btn_play);
		level_menu_btn_play:addEventListener("touch", closeMenu);	


	
	--- insert everything into the localGroup	
	localGroup:insert(btn_level_menu)
	localGroup:insert(level_menu)
	
	
	-- clean everything up
	clean = function ()
	
	end
	
	-- do not remove lest the sky shalt fall upon thine head
	return localGroup
	
end