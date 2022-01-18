function ScreenTitleProcess()
{
	/* Exit if fade is active. Notice that because of this we perform
	transition in the Draw End event !*/
	if fade_check(StateActive)
	{
		exit;
	}
	
	// Update room
	if State != TitleState.Settings
	{
		StateTimer++; palette_handle_range(TypePrimary, 0, 3, 4, 1, 6);
	}
	
	// Play the music and scroll the background by moving the camera
	if StateTimer == 1
	{
		audio_bgm_play(ChannelPrimary, TitleTheme);
	}
	else if StateTimer > 42 and State != TitleState.Settings
	{
		Camera.PosX += 2;
	}
	
	// State Machine
	switch State
	{
		case TitleState.preRoll:
		{		
			if StateTimer == 409
			{
				LoadFlag = TitleLoad.loadDemo; fade_perform(ModeInto, BlendBlack, 1);
				
				// Set data
				Game.Emeralds   =  0;
				Game.Lives	    =  3;
				Game.Continues  =  0;
				Game.Score	    =  0;
				Game.ActiveSave = -1;
			}
			else if Input.StartPress
			{
				if StateTimer > 29
				{
					State = TitleState.Main; audio_sfx_play(sfxStarPost, false);
				}
			}
		}
		break;
		case TitleState.Main:
		{
			// Loop through options
			if Input.LeftPress
			{
				StateOption--; audio_sfx_play(sfxScoreCount, false);
			}
			else if Input.RightPress
			{
				StateOption++; audio_sfx_play(sfxScoreCount, false);
			}
			StateOption = loop_value(StateOption, 0, 3);
			
			// React to Start button
			if Input.StartPress switch StateOption
			{
				case 0:
				{
					// Set data
					Game.Emeralds   =  0;
					Game.Lives	    =  3;
					Game.Continues  =  0;
					Game.Score	    =  0;
					Game.ActiveSave = -1;
					
					audio_sfx_play(sfxStarPost,    false);
					audio_bgm_stop(ChannelPrimary, 0.5);
						
					// Fade out
					LoadFlag = TitleLoad.loadStage; fade_perform(ModeInto, BlendBlack, 1);
				}
				break;
				case 1:
				{	
					// Replace palette
					palette_set_colour_range(TypePrimary, 0, 3,  5);
					palette_set_colour_range(TypePrimary, 4, 19, 2);
					
					// Set flags
					State = TitleState.Settings; Background.AllowScrolling = false;
					
					// Play sound
					audio_sfx_play(sfxStarPost, false);
				}
				break;
				case 2:
				{
					LoadFlag = TitleLoad.loadEnd; fade_perform(ModeInto, BlendBlack, 1); audio_sfx_play(sfxStarPost, false);
				}
				break;
			}
		}
		break;
		case TitleState.Settings:
		{
			// Loop through options
			if Input.UpPress
			{
				if SettingOption == 15
				{
					SettingOption = 12;
				}
				else if SettingOption == 20
				{
					SettingOption = 16;
				}
				else
				{
					SettingOption--; 
				}
				audio_sfx_play(sfxScoreCount, false);
				
			}
			else if Input.DownPress
			{
				if SettingOption == 12
				{
					SettingOption = 15;
				}
				else if SettingOption == 16
				{
					SettingOption = 20;
				}
				else
				{
					SettingOption++; 
				}
				audio_sfx_play(sfxScoreCount, false);		
			}
			SettingOption = loop_value(SettingOption, 2, array_length(StringData));
			
			// Toggle options
			switch SettingOption
			{
				case 2: Game.Character		    = toggle_option(Game.Character, 2);	         break;
				case 3: Game.SpindashEnabled    = toggle_option(Game.SpindashEnabled, 1);    break;
				case 4: Game.PeeloutEnabled     = toggle_option(Game.PeeloutEnabled, 1);     break;
				case 5: Game.DSpinAttackEnabled = toggle_option(Game.DSpinAttackEnabled, 1); break;
				case 6: Game.RolljumpControl    = toggle_option(Game.RolljumpControl, 1);	 break;
				case 7: Game.FlightCancel       = toggle_option(Game.FlightCancel, 1);	     break;
				case 8:							  toggle_option("speedcap", 2);				 break;
				case 9:  Game.StageTransitions  = toggle_option(Game.StageTransitions, 1);   break;
				case 10: Game.SmoothRotation    = toggle_option(Game.SmoothRotation, 1);     break;
				case 11: Game.CDCamera		    = toggle_option(Game.CDCamera, 1);		     break;
				case 12: Game.CDStageTimer      = toggle_option(Game.CDStageTimer, 1);       break;
				case 15:						  toggle_option("fullscreen", "");			 break;
				case 16:						  toggle_option("size", 4);					 break;
				case 20:						  toggle_option("music", 10);				 break;
				case 21:						  toggle_option("sound", 10);				 break;
				default: break;
			}
			
			if Input.BPress
			{		
				Background.AllowScrolling = true;
				palette_set_colour_range(TypePrimary, 0, 19, 1); audio_sfx_play(sfxStarPost, false);
				
				// Reset state
				State		  = TitleState.Main;
				SettingOption = 2;
			}
		}
		break;
	}
}