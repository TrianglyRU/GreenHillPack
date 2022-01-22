function MenuManualProcess()
{
	switch MenuID
	{
		// Main Menu
		case 0:
		{
			if (Input.APress or Input.StartPress) and OptionID == 4
			{
				game_end();
			}
		}
		break;
		
		// Game Start menu
		case 1:
		{
			if Input.APress or Input.StartPress
			{
				// Set active save (no-save slot will be -1)
				Game.ActiveSave = OptionID - 1;
				
				// Get data is selected not a "no-save" slot
				if OptionID and OptionID < 5
				{
					// Get slot
					var Slot  = Game.SaveData[Game.ActiveSave];
					if  Slot != 0
					{
						// Apply data
						Game.Character = Slot[0];
						Game.Stage	   = Slot[1];
						Game.Emeralds  = Slot[2];
						Game.Lives	   = Slot[3];
						Game.Continues = Slot[4];
						Game.SaveState = Slot[5];
						Game.Score	   = Slot[6];
				
						// Load stage if the game is not completed. Game.Stage is a ZoneID you set in StageSetup()
						if !Game.SaveState
						{
							room_goto(ZoneOrder[Game.Stage]);	
						}
						
						// Cancel MenuAutomaticProcess()
						return true;
					}
				}
			}
		}
		break;
	
		// Character Select
		case 3:
		case 4:
		{
			if Input.APress or Input.StartPress
			{
				Game.Character = OptionID;
				Game.Emeralds  = 0;
				Game.Lives	   = 3;
				Game.Continues = 0;
				Game.Score	   = 0;	
				
				// If starting a new game, save data if we're not in "no-save" mode
				if MenuID == 3 and Game.ActiveSave != -1
				{
					gamedata_save(Game.ActiveSave);
				}		
			}
		}
		break;
		
		// Stage / Screen Select
		case 5:
		case 6:
		{
			if Input.APress or Input.StartPress
			{
				// Load into the room in "no-save" mode
				Game.ActiveSave = -1;
				room_goto(MenuRedirect[MenuID][OptionID]);
				
				// Cancel MenuAutomaticProcess()
				return true;
			}
		}
		break;
		
		// Options
		case 7:
		{	
			if Input.LeftPress or Input.RightPress
			{
				switch OptionID
				{
					// Window size toggle
					case 0:
					{
						Game.WindowSize = loop_value(Game.WindowSize + (Input.RightPress ? 1 : -1), 1, 5);
						window_set_size(Game.Width * Game.WindowSize, Game.Height * Game.WindowSize);
						
						menu_update_option(MenuID, OptionID, "WINDOW SIZE: " + string(Game.WindowSize) + "X");
					}
					break;
				
					// Fullscreen toggle
					case 1:	
					{
						Game.WindowFullscreen = !Game.WindowFullscreen;			
						window_set_fullscreen(Game.WindowFullscreen);
						
						menu_update_option(MenuID, OptionID, "FULLSCREEN: " + menu_get_boolean(Game.WindowFullscreen));
					}
					break;
					
					// SFX volume
					case 2:
					{
						Game.SoundVolume = loop_value(Game.SoundVolume * 10 + (Input.RightPress ? 1 : -1), 0, 11) / 10;
					
						menu_update_option(MenuID, OptionID, "SOUND VOLUME: " + string(round(Game.SoundVolume * 100)));	
					}
					break;
		
					// BGM volume
					case 3:
					{
						Game.MusicVolume = loop_value(Game.MusicVolume * 10 + (Input.RightPress ? 1 : -1), 0, 11) / 10;
						
						menu_update_option(MenuID, OptionID, "MUSIC VOLUME: " + string(round(Game.MusicVolume * 100)));
					}
					break;
				}
			}
			
			// Update config file
			else if Input.BPress
			{
				gamesettings_save("config");
			}
		}
		break;
		
		// Save Deletion
		case 8:
		{
			if Input.APress or Input.StartPress
			{
				Game.SaveData[OptionID] = 0;
				file_delete("saveslot" + string(OptionID + 1) + ".bin");	
		
				menu_update_option(1, OptionID + 1, "SAVE " + string(OptionID + 1) + " - NEW GAME");
			}
		}
		break;
		
		// Demo Files
		case 9:
		{	
			if Input.APress or Input.StartPress
			{
				switch OptionID
				{
					// Record demo
					case 0:
					{
						Game.DemoMode = DemoRecord;
					}
					break;
					
					// Save the demo
					case 1:
					{	
						if array_equals(Game.DemoData, []) 
						{
							audio_sfx_play(sfxFail, false); break;
						}
						var Dir  = get_save_filename_ext("Demo File|*.demo", "", temp_directory, "Save a demo file");
						if  Dir != ""
						{ 
							var String = json_stringify(Game.DemoData);
							var Buffer = buffer_create(string_byte_length(String) + 1, buffer_fixed, 1);
							
							buffer_write(Buffer, buffer_string, String);
							buffer_save(Buffer, Dir);
							buffer_delete(Buffer);
						}
						else
						{
							audio_sfx_play(sfxFail, false);
						}
					}
					break;
					
					// Load a demo
					case 2:
					{
						demodata_load(false);
					}
					break;
					
					// Play a demo
					case 3:
					{
						if array_equals(Game.DemoData, []) 
						{
							audio_sfx_play(sfxFail, false);
							
							// Cancel MenuAutomaticProcess()
							return true;
						}
						else
						{
							Game.DemoMode = DemoPlay;
						}
					}
					break;
				}
			}
			else
			{
				Game.DemoMode = false;
			}
		}
		break;
	}
	return false;
}