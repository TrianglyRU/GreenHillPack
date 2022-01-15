function MenuSetup()
{
	// Main Menu
	menu_add_header(0,    "GREEN HILL REVISITED" + "\n\nDEV MENU");
	menu_add_option(0, 0, "GAME START");
	menu_add_option(0, 1, "STAGE SELECT");
	menu_add_option(0, 2, "OPTIONS");
	menu_add_option(0, 3, "EXIT GAME");

	// Game Start
	menu_add_header(1,    "SELECT A SAVE FILE");
	menu_add_option(1, 0, "NO SAVE MODE");
	menu_add_option(1, 1, string(DisplayData[0]));
	menu_add_option(1, 2, string(DisplayData[1]));
	menu_add_option(1, 3, string(DisplayData[2]));
	menu_add_option(1, 4, string(DisplayData[3]));
	menu_add_option(1, 5, "DELETE SAVE");
	menu_add_option(1, 6, "DEMO FILES");
	
	// Game Start (character select)
	menu_add_header(2,    "SELECT A PLAYER");
	menu_add_option(2, 0, "SONIC");
	menu_add_option(2, 1, "TAILS");
	menu_add_option(2, 2, "KNUCKLES");
	
	// Stage Select (character select)
	menu_add_header(3,    "SELECT A PLAYER");
	menu_add_option(3, 0, "SONIC");
	menu_add_option(3, 1, "TAILS");
	menu_add_option(3, 2, "KNUCKLES");
	
	// Stage Select
	menu_add_header(4,    "SELECT A STAGE");
	menu_add_option(4, 0, "GREEN HILL 1");
	menu_add_option(4, 1, "GREEN HILL 2");
	menu_add_option(4, 2, "GREEN HILL 3");
	
	// Options
	menu_add_header(5,    "GAME OPTIONS");
	menu_add_option(5, 0, "VIDEO");
	menu_add_option(5, 1, "AUDIO");
	menu_add_option(5, 2, "CONTROLS");
	
	// Options (video)
	menu_add_header(6,    "VIDEO OPTIONS");
	menu_add_option(6, 0, "WINDOW SIZE: " + string(Game.WindowSize) + "X");
	menu_add_option(6, 1, "FULLSCREEN: "  + string(menu_get_boolean(Game.WindowFullscreen)));
	
	// Options (audio)
	menu_add_header(7,    "AUDIO OPTIONS");
	menu_add_option(7, 0, "SFX VOLUME: " + string(round(Game.SoundVolume * 100)));
	menu_add_option(7, 1, "BGM VOLUME: " + string(round(Game.MusicVolume * 100)));
	
	// Options (controls)
	menu_add_header(8,    "CONTROL OPTIONS");
	menu_add_option(8, 0, "UP:"    + menu_get_keyname(Game.KeyboardControl[0]));
	menu_add_option(8, 1, "DOWN:"  + menu_get_keyname(Game.KeyboardControl[1]));
	menu_add_option(8, 2, "LEFT:"  + menu_get_keyname(Game.KeyboardControl[2]));
	menu_add_option(8, 3, "RIGHT:" + menu_get_keyname(Game.KeyboardControl[3]));
	menu_add_option(8, 4, "A:"     + menu_get_keyname(Game.KeyboardControl[4]));
	menu_add_option(8, 5, "B:"     + menu_get_keyname(Game.KeyboardControl[5]));
	menu_add_option(8, 6, "C:"	   + menu_get_keyname(Game.KeyboardControl[6]));
	menu_add_option(8, 7, "MODE:"  + menu_get_keyname(Game.KeyboardControl[7]));
	menu_add_option(8, 8, "START:" + menu_get_keyname(Game.KeyboardControl[8]));
	
	// Game Start (delete data)
	menu_add_header(9,    "SELECT A SAVE FILE TO DELETE");
	menu_add_option(9, 0, "SLOT 1");
	menu_add_option(9, 1, "SLOT 2");
	menu_add_option(9, 2, "SLOT 3");
	menu_add_option(9, 3, "SLOT 4");
	
	// Game Start (demo files)
    menu_add_header(10,    "DEMO FILES");
    menu_add_option(10, 0, "RECORD FILE");
    menu_add_option(10, 1, "SAVE FILE");
    menu_add_option(10, 2, "LOAD FILE");
    menu_add_option(10, 3, "PLAY FILE");
}