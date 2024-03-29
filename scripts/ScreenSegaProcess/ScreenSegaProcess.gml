function ScreenSegaProcess()
{
	switch State
	{
		// Shift SEGA palette
		case 0:
		{	
			var Colour = palette_get_colour(TypePrimary, 0);
			if  Colour < 54
			{
				palette_handle_range(TypePrimary, 0, 47, 54, 54, 1);
			}
			else
			{
				State++;
			}
		}
		break;
		
		// Show up SEGA logo
		case 1:
		{
			if (++StateTimer) == 20
			{
				State	  += 1;
				StateTimer = 0;
				
				// Play sound
				audio_sfx_play(sfxSega, false);
			}
		}
		break;
		
		// Swap logos
		case 2:
		{
			if (++StateTimer) == 160
			{
				fade_perform(ModeInto, BlendBlack, 1);
			}
			else if fade_check(StateMax)
			{
				// Increment state
				State	  += 1;
				StateTimer = 0;
				
				// Set background colour to black
				layer_background_blend(layer_background_get_id("Background"), c_black);
				
				// Fade from
				fade_perform(ModeFrom, BlendBlack, 1);
			}
		}
		break;
		
		// Go to the next room
		case 3:
		{
			if (++StateTimer) == 80
			{
				fade_perform(ModeInto, BlendBlack, 1);
			}
			else if fade_check(StateMax)
			{
				if file_exists("versioncheck.bin")
				{
					room_goto(Screen_Title);
				}
				else
				{
					var File = file_bin_open("versioncheck.bin", 1);
					
					file_bin_write_byte(File, Game.Version); 
					file_bin_close(File);
					
					// Set settings in case they were overwritten (somehow?)
					Game.DropdashEnabled = false;
					Game.AirSpeedcap     = false;
					Game.GroundSpeedcap  = false;
					Game.FlightCancel    = false;
					Game.SpindashEnabled = true;
					
					Game.IntroSequence = true;
					Game.Character     = CharSonic;
					
					demodata_load("demo_intro"); room_goto(Stage_GHZ1);
				}
			}
		}
		break;
	}
}