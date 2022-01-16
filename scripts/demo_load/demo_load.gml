/// @function demodata_load(demofile)
function demodata_load(demofile)
{
	// Manually select a file or choose a specific one
	if demofile == false
	{
		var File  = get_open_filename_ext("Demo File|*.demo", "", temp_directory, "Open a demo file");
	}
	else
	{
		var File = "demofiles/" + demofile + ".demo";
	}
	
	// Load it
	if File != "" 
	{ 
		var Buffer = buffer_load(File);
		if  Buffer != -1
		{
			Game.DemoData = json_parse(buffer_read(Buffer, buffer_string));
			buffer_delete(Buffer);
		}
		
		// Update demo mode
		Game.DemoMode = DemoPlay;
	}
	
	// If failed, play sound
	else
	{
		audio_sfx_play(sfxFail, false);
	}
}