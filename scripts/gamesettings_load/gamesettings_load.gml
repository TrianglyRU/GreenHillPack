/// @function gamesettings_load(filename)
function gamesettings_load(filename)
{
	// Exit if in devmode
	if Game.DevMode
	{
		exit;
	}
	
	// Open config file
	ini_open(filename + ".ini");
		
	// Load data
	Game.KeyboardControl[0] = ini_read_real("Control",  "Up",		   vk_up);
	Game.KeyboardControl[1] = ini_read_real("Control",	"Down",		   vk_down);
	Game.KeyboardControl[2] = ini_read_real("Control",	"Left",		   vk_left);
	Game.KeyboardControl[3] = ini_read_real("Control",	"Right",	   vk_right);
	Game.KeyboardControl[4] = ini_read_real("Control",	"A",		   ord("Z"));
	Game.KeyboardControl[5] = ini_read_real("Control",	"B",		   ord("X"));
	Game.KeyboardControl[6] = ini_read_real("Control",	"C",		   ord("C"));
	Game.KeyboardControl[7] = ini_read_real("Control",	"Mode",		   vk_space);
	Game.KeyboardControl[8] = ini_read_real("Control",	"Start",	   vk_enter);
	Game.Width				= ini_read_real("Video",	"Width",       400);
	Game.Height				= ini_read_real("Video",	"Height",      224);
	Game.WindowSize		    = ini_read_real("Video",	"Size",        4);
	Game.WindowFullscreen   = ini_read_real("Video",	"Fullscreen",  false);
	Game.MusicVolume        = ini_read_real("Music",	"MusicVolume", 0.5);
	Game.SoundVolume        = ini_read_real("Music",	"SoundVolume", 0.5);
	
	
	// Close file
	ini_close();
}