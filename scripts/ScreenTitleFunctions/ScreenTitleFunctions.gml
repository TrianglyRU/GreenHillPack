function ScreenTitleFunctions()
{
	/// @function get_boolean(bool)
	function get_boolean(bool)
	{
		if bool
		{
			return "ON";
		}
		else
		{
			return "OFF";
		}
	}
	
	/// @function get_option(option)
	function get_option(option)
	{
		switch option
		{
			case "character":
			{
					 if Game.Character == 0 return "SONIC";
				else if Game.Character == 1 return "TAILS";
				else if Game.Character == 2 return "KNUCKLES";
			}
			break;
			case "speedcap":
			{
				if Game.GroundSpeedcap and Game.AirSpeedcap
				{
					return "SONIC 1";
				}
				else if !Game.GroundSpeedcap and Game.AirSpeedcap
				{
					return "SONIC 2";
				}
				else if Game.GroundSpeedcap and !Game.AirSpeedcap
				{
					return "WHAT";
				}
				else
				{
					return "OFF"
				}
			}
			break;
			case "camera":
			{
				if !Game.CDCamera then return "REGULAR" else return "SONIC CD";
			}
			break;
			case "timer":
			{
				if !Game.CDStageTimer then return "REGULAR" else return "SONIC CD";
			}
			break;
			case "resolution":
			{
				if Game.Width < 400 then return "ORIGINAL" else return "WIDESCREEN";
			}
			break;
		}
	}
	
	/// @function toggle_option(option, maxValue)
	function toggle_option(option, maxValue)
	{
		switch option
		{
			case "speedcap":
			{
				// Get current value
				if Game.GroundSpeedcap and Game.AirSpeedcap
				{
					var State = 0;
				}
				else if !Game.GroundSpeedcap and Game.AirSpeedcap
				{
					var State = 1;
				}
				else
				{
					var State = 2;
				}
			
				// Update value
				if Input.LeftPress or Input.RightPress
				{
					if Input.LeftPress
					{
						State--; audio_sfx_play(sfxScoreCount, false);
					}
					else
					{
						State++; audio_sfx_play(sfxScoreCount, false); 
					}
					var NewState = loop_value(State, 0, maxValue + 1);
		
					switch NewState
					{
						case 0:
							Game.GroundSpeedcap = true; Game.AirSpeedcap = true;
						break;
						case 1:
							Game.GroundSpeedcap = false; Game.AirSpeedcap = true;
						break;
						case 2:
							Game.GroundSpeedcap = false; Game.AirSpeedcap = false;
						break;
					}
				}
			}
			break;
			case "resolution":
			{
				var Width = Game.Width;		
				if Input.LeftPress
				{
					Game.Width -= 80; audio_sfx_play(sfxScoreCount, false);
				}
				else if Input.RightPress
				{
					Game.Width += 80; 
					
					audio_sfx_play(sfxScoreCount, false);
				}
				Game.Width = loop_value(Game.Width, 320, 480);
				
				// Update application size
				if Game.Width != Width
				{
					application_set_size(Game.Width, Game.Height);
				}
			}
			break;
			case "music":
			{
				if Input.LeftPress
				{
					Game.MusicVolume = loop_value(Game.MusicVolume * 10 - 1, 0, maxValue + 1) / 10; audio_sfx_play(sfxScoreCount, false);
				}
				else if Input.RightPress
				{
					Game.MusicVolume = loop_value(Game.MusicVolume * 10 + 1, 0, maxValue + 1) / 10; audio_sfx_play(sfxScoreCount, false);
				}
				
				// Update volume
				audio_sound_gain(TitleTheme_FM,  Game.MusicVolume, 0);
				audio_sound_gain(TitleTheme_DAC, Game.MusicVolume, 0);
				audio_sound_gain(Intro_FM,		 Game.MusicVolume, 0);
				audio_sound_gain(Intro_DAC,		 Game.MusicVolume, 0);
			}
			break;
			case "sound":
			{
				if Input.LeftPress
				{
					Game.SoundVolume = loop_value(Game.SoundVolume * 10 - 1, 0, maxValue + 1) / 10; audio_sfx_play(sfxScoreCount, false);
				}
				else if Input.RightPress
				{
					Game.SoundVolume = loop_value(Game.SoundVolume * 10 + 1, 0, maxValue + 1) / 10; audio_sfx_play(sfxScoreCount, false);
				}
			}
			break;
			case "fullscreen":
			{
				if Input.LeftPress or Input.RightPress
				{
					window_set_fullscreen(!window_get_fullscreen()); 
					audio_sfx_play(sfxScoreCount, false);
				}
			}
			break;
			case "size":
			{
				if Input.LeftPress
				{
					Game.WindowSize--; audio_sfx_play(sfxScoreCount, false);
				}
				else if Input.RightPress
				{
					Game.WindowSize++; audio_sfx_play(sfxScoreCount, false);
				}
				Game.WindowSize = loop_value(Game.WindowSize, 1, maxValue + 1); 
				
				// Update window
				window_set_size(Game.Width * Game.WindowSize, Game.Height * Game.WindowSize);
			}
			break;
			default:
			{
				if maxValue == 1
				{
					if Input.LeftPress or Input.RightPress
					{
						audio_sfx_play(sfxScoreCount, false); option = !option; return option;
					}
				}
				else if Input.LeftPress
				{
					option--; audio_sfx_play(sfxScoreCount, false);
				}
				else if Input.RightPress
				{
					option++; audio_sfx_play(sfxScoreCount, false);
				}
				option = loop_value(option, 0, maxValue + 1); return option;
			}
			break;
		}
	}
}