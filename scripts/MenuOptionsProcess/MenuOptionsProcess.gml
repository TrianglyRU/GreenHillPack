function MenuOptionsProcess()
{
	switch MenuID
	{
		// Main Menu
		case 0:
		{
			if Input.APress or Input.StartPress
			{
				switch OptionID
				{
					case 0:
						menu_list_redirect(1, true, true);
					break;
					case 1:
						menu_list_redirect(3, true, true);
					break;
					case 2:
						menu_list_redirect(5, true, true);
					break;
					case 3:
						game_end();
					break;
				}
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
				
				switch OptionID
				{
					// Redirect to character select if selected no-save slot
					case 0:
					{
						menu_list_redirect(2, true, true);
					}
					break;
					
					case 1:
					case 2:
					case 3:
					case 4:
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
								switch Game.Stage
								{
									default:
										room_goto(Stage_GHZ1);
									break;
								}
							}
							else
							{
								/* You can add redirection to your in-game level select here,
								we'll play funny sound instead :P */	
								audio_sfx_play(sfxScoreTally, false);
							}
						}
					
						// Redirect to character select if slot is empty
						else
						{
							menu_list_redirect(2, true, true);
						}
					}
					break;
				
					// Redirect to save deletion
					case 5:
						menu_list_redirect(9, false, true);
					break;
					
					// Redirect to demo files menu
					case 6:
						menu_list_redirect(10, true, true);
					break;
				}
			}
		}
		break;
	
		// Character Select
		case 2:
		case 3:
		{
			if Input.APress or Input.StartPress
			{
				Game.Character = OptionID;
				Game.Emeralds  = 0;
				Game.Lives	   = 3;
				Game.Continues = 0;
				Game.Score	   = 0;	
				
				// Start a new game
				if MenuID == 2
				{
					// Save data if not in "no-save" mode
					if Game.ActiveSave != -1
					{
						gamedata_save(Game.ActiveSave);
					}
					room_goto(Stage_GHZ1);
				}
				
				// Redirect to Stage Select
				else
				{
					menu_list_redirect(4, false, true);
				}			
			}
		}
		break;
		
		// Stage Select
		case 4:
		{
			if Input.APress or Input.StartPress
			{
				// Use "no save" slot
				Game.ActiveSave = -1;
		
				// Load stage
				switch OptionID
				{
					case 0:
						room_goto(Stage_GHZ1);
					break;
					case 1:
						room_goto(Stage_GHZ2);
					break;
					case 2:
						room_goto(Stage_GHZ3);
					break;
					default: 
						audio_sfx_play(sfxFail, false);
					break;
				}
			}
		}
		break;
	
		// Options (main)
		case 5:
		{	
			if Input.APress or Input.StartPress
			{
				switch OptionID
				{			
					// Redirect to video options
					case 0:
						menu_list_redirect(6, true, true);
					break;
					
					// Redirect to audio options
					case 1:
						menu_list_redirect(7, true, true);
					break;
					
					// Redirect to control options
					case 2:
						menu_list_redirect(8, true, true);
					break;
				}
			}
			else if Input.BPress
			{
				// Update config file
				gamesettings_save("config");
			}
		}
		break;
	
		// Options (video)
		case 6:
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
				
						// Update option
						menu_update_option(6, 0, "WINDOW SIZE: " + string(Game.WindowSize) + "X");	
					}
					break;
				
					// Fullscreen toggle
					case 1:	
					{
						Game.WindowFullscreen = !Game.WindowFullscreen;
						window_set_fullscreen(Game.WindowFullscreen);
				
						// Update option
						menu_update_option(6, 1, "FULLSCREEN: " + menu_get_boolean(Game.WindowFullscreen));
					}
					break;
				}
			}
		}
		break;
	
		// Options (audio)
		case 7:
		{
			if Input.LeftPress or Input.RightPress
			{
				// SFX volume
				if OptionID == 0
				{
					Game.SoundVolume = loop_value(Game.SoundVolume * 10 + (Input.RightPress ? 1 : -1), 0, 11) / 10;
					
					// Update option
					menu_update_option(7, 0, "SFX VOLUME: " + string(round(Game.SoundVolume * 100)));	
				}
		
				// BGM volume
				else if OptionID == 1
				{
					Game.MusicVolume = loop_value(Game.MusicVolume * 10 + (Input.RightPress ? 1 : -1), 0, 11) / 10;
				
					// Update option
					menu_update_option(7, 1, "BGM VOLUME: " + string(round(Game.MusicVolume * 100)));
				}
			}
		}
		break;
		
		// Options (controls)
		case 8:
		{
			var Buttons = ["UP", "DOWN", "LEFT", "RIGHT", "A", "B", "C", "MODE", "START"];
			
			// Assign key
			if Input.IgnoreInput
			{
				if keyboard_key and keyboard_check_pressed(vk_anykey)
				{
					for (var i = 0; i < 9; i++)
					{
						if OptionID != i and keyboard_key == Game.KeyboardControl[i]
						{
							var CurrentButton = Game.KeyboardControl[OptionID];
							Game.KeyboardControl[i] = CurrentButton;
							
							// Update option
							menu_update_option(8, i, Buttons[i] + ":" + menu_get_keyname(CurrentButton));
						}
					}
					Input.IgnoreInput = false;
					Game.KeyboardControl[OptionID] = keyboard_key;
					
					// Update option
					menu_update_option(8, OptionID, Buttons[OptionID] + ":" + menu_get_keyname(keyboard_key));
				}
			}
			
			// Select key
			else if Input.APress or Input.StartPress
			{
				Input.IgnoreInput = true;
				
				// Update option
				menu_update_option(8, OptionID, Buttons[OptionID] + ":" + "*-*");
			}
		}
		break;
		
		// Game Start (save deletion)
		case 9:
		{
			if Input.APress or Input.StartPress
			{
				// Delete data
				Game.SaveData[OptionID] = 0;
				file_delete("saveslot" + string(OptionID + 1) + ".bin");	
		
				// Update option
				menu_update_option(1, OptionID + 1, "SAVE " + string(OptionID + 1) + " - NEW GAME");
				
				// Redirect back to save select
				menu_list_redirect(1, false, false);
			}
		}
		break;
		
		// Game Start (demo files)
		case 10:
		{	
			if Input.APress or Input.StartPress
			{
				switch OptionID
				{
					// Record demo
					case 0:
					{
						Game.DemoMode = DemoRecord; menu_list_redirect(3, true, true);
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
						}
						else
						{
							menu_list_redirect(3, true, true);
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
}