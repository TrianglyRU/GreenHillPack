function MenuSetup()
{
	// Set stage list / data here
	ZoneOrder =
	[
		Stage_GHZ1
	];
	StartStage = Stage_GHZ1;
	
	// Scene Select
	menu_add_header(5,    "SELECT A STAGE");
	menu_add_option(5, 0, "GREEN HILL 1", Stage_GHZ1);
	menu_add_option(5, 1, "GREEN HILL 2", Stage_GHZ2);
	menu_add_option(5, 2, "GREEN HILL 3", Stage_GHZ3);
	
	// Screen select
	menu_add_header(6,    "SELECT A SCREEN");
	menu_add_option(6, 0, "SEGA SCREEN",  Screen_SEGA);
	menu_add_option(6, 1, "TITLE SCREEN", Screen_Title);
	
	#region Other
	{
		// Main Menu
		menu_add_header(0,    "ORBINAUT FRAMEWORK" + "\n\nDEVELOPER MENU");
		menu_add_option(0, 0, "GAME START",   1);
		menu_add_option(0, 1, "SCENE SELECT", 2);
		menu_add_option(0, 2, "OPTIONS",      7);	
		menu_add_option(0, 3, "DEMO FILES",   9);
		menu_add_option(0, 4, "EXIT GAME",    noone);
	
		// Game Start
		menu_add_header(1,    "SELECT A SAVE FILE");
		menu_add_option(1, 0, "NO SAVE MODE",		  3);
		menu_add_option(1, 1, string(DisplayData[0]), 3);
		menu_add_option(1, 2, string(DisplayData[1]), 3);
		menu_add_option(1, 3, string(DisplayData[2]), 3);
		menu_add_option(1, 4, string(DisplayData[3]), 3);
		menu_add_option(1, 5, "DELETE SAVE",		  9);
	
		// Scene Select
		menu_add_header(2,    "SELECT SCENE TYPE");
		menu_add_option(2, 0, "STAGE",  4);
		menu_add_option(2, 1, "SCREEN", 6);
	
		// Character Select (Game Start and Stage Select)
		menu_add_header(3,    "SELECT A PLAYER");		menu_add_header(4,    "SELECT A PLAYER");
		menu_add_option(3, 0, "SONIC",	  StartStage);	menu_add_option(4, 0, "SONIC",	  5);
		menu_add_option(3, 1, "TAILS",	  StartStage);	menu_add_option(4, 1, "TAILS",	  5);
		menu_add_option(3, 2, "KNUCKLES", StartStage);	menu_add_option(4, 2, "KNUCKLES", 5);
	
		// Options
		menu_add_header(7,    "OPTIONS");
		menu_add_option(7, 0, "WINDOW SIZE: "  + string(Game.WindowSize) + "X",					  noone);
		menu_add_option(7, 1, "FULLSCREEN: "   + string(menu_get_boolean(Game.WindowFullscreen)), noone);
		menu_add_option(7, 2, "SOUND VOLUME: " + string(round(Game.SoundVolume * 100)),			  noone);
		menu_add_option(7, 3, "MUSIC VOLUME: " + string(round(Game.MusicVolume * 100)),			  noone);
	
		// Game Start (delete data)
		menu_add_header(8,    "SELECT A SAVE FILE TO DELETE");
		menu_add_option(8, 0, "SLOT 1", 1);
		menu_add_option(8, 1, "SLOT 2", 1);
		menu_add_option(8, 2, "SLOT 3", 1);
		menu_add_option(8, 3, "SLOT 4", 1);
	
		// Game Start (demo files)
	    menu_add_header(9,    "DEMO FILES");
	    menu_add_option(9, 0, "RECORD FILE",   4);
	    menu_add_option(9, 1, "SAVE FILE", noone);
	    menu_add_option(9, 2, "LOAD FILE", noone);
	    menu_add_option(9, 3, "PLAY FILE",     4);
	}
	#endregion
}