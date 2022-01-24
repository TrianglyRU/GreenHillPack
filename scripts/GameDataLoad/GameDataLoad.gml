function GameDataLoad()
{
	// Load saved game data
	for (var i = 0; i < 4; i++)
	{
		Game.SaveData[i] = gamedata_load(i);
	}
	
	// Clear data
	if !file_exists("versioncheck.bin")
	{
		file_delete("config.ini");
		file_delete("gamedata.bin");
		file_delete("credits.bin");
	}
	else
	{
		var File  = file_bin_open("versioncheck.bin", 0);
		var Check = file_bin_read_byte(File);
		
		if Check != Game.Version
		{
			file_delete("config.ini");
			file_delete("gamedata.bin");
			file_delete("credits.bin");
		}
	}
	for (var i = 0; i < 4; i++)
	{
		var File = "saveslot" + string(i) + ".bin";
		if  file_exists(File)
		{
			file_delete(File);
		}
	}
	
	/* versioncheck.bin is created on the first startup in the ScreenSegaProcess() 
	script and is also used to define if we should play the intro or not */
	
	// Load config file and generate random seed
	gamesettings_load("config");
	random_set_seed(randomise());
}