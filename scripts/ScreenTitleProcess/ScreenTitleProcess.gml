function ScreenTitleProcess()
{
	/* Exit if fade is active. Notice that because of this we perform
	transition in the Step End event !*/
	if fade_check(StateActive)
	{
		exit;
	}

	// Update room
	if State != TitleState.Settings
	{
		if (++StateTimer) == 1
		{
			Game.UpdateAnimations = true; 
			Camera.Enabled        = true;
			
			if !Game.IntroSequence
			{
				audio_bgm_play(ChannelPrimary, TitleTheme_FM);
			}
			else
			{
				audio_bgm_play_intro(Intro_FM); Game.IntroSequence = false;
			}
		} 
		else if StateTimer > 42
		{
			Camera.PosX += 2;
		}
		palette_handle_range(TypePrimary, 0, 3, 4, 1, 6);
	}
	
	// State Machine
	switch State
	{
		case TitleState.preRoll:
		{		
			if LoadFlag == TitleLoad.loadNone
			{
				if StateTimer > 408 and !audio_bgm_is_playing(Intro_FM)
				{
					LoadFlag = TitleLoad.loadDemo; fade_perform(ModeInto, BlendBlack, 1);
				
					// Set data
					Game.Emeralds   =  0;
					Game.Lives	    =  3;
					Game.Continues  =  0;
					Game.Score	    =  0;
					Game.ActiveSave = -1;

					Game.UpdateAnimations = false;
				}
				else if Input.StartPress
				{
					if StateTimer > 29
					{
						State = TitleState.Main; 
						
						gametweaks_load();
						audio_sfx_play(sfxStarPost, false);
					}
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
					Game.Emeralds         =  0;
					Game.Lives			  =  3;
					Game.Continues		  =  0;
					Game.Score			  =  0;
					Game.ActiveSave		  = -1;
					
					Game.UpdateAnimations = false;
					LoadFlag			  = TitleLoad.loadStage;	
					
					audio_sfx_play(sfxStarPost,    false);
					audio_bgm_stop(ChannelPrimary, 0.5);
					
					fade_perform(ModeInto, BlendBlack, 1);
				}
				break;
				case 1:
				{	
					palette_set_colour_range(TypePrimary, 0, 3,  5);
					palette_set_colour_range(TypePrimary, 4, 19, 2);
					
					audio_sfx_play(sfxStarPost, false);
					
					Game.UpdateAnimations = false;
					State				  = TitleState.Settings;	
				}
				break;
				case 2:
				{
					fade_perform(ModeInto, BlendBlack, 1); 
					audio_sfx_play(sfxStarPost, false);
					
					audio_bgm_stop(ChannelPrimary, 0.5);
					
					Game.UpdateAnimations = false;
					LoadFlag			  = TitleLoad.loadEnd; 
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
				if SettingOption == 17
				{
					SettingOption = 14;
				}
				else if SettingOption == 23
				{
					SettingOption = 19;
				}
				else
				{
					SettingOption--; 
				}
				audio_sfx_play(sfxScoreCount, false);
				
			}
			else if Input.DownPress
			{
				if SettingOption == 14
				{
					SettingOption = 17;
				}
				else if SettingOption == 19
				{
					SettingOption = 23;
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
				case 4: Game.DropdashEnabled    = toggle_option(Game.DropdashEnabled, 1);    break;
				case 5: Game.PeeloutEnabled     = toggle_option(Game.PeeloutEnabled, 1);     break;
				case 6: Game.DSpinAttackEnabled = toggle_option(Game.DSpinAttackEnabled, 1); break;
				case 7: Game.RolljumpControl    = toggle_option(Game.RolljumpControl, 1);	 break;
				case 8: Game.FlightCancel       = toggle_option(Game.FlightCancel, 1);	     break;
				case 9:							  toggle_option("speedcap", 2);				 break;
				case 10:  Game.ElementalBarriers = toggle_option(Game.ElementalBarriers, 1);  break;
				case 11: Game.StageTransitions  = toggle_option(Game.StageTransitions, 1);   break;
				case 12: Game.SmoothRotation    = toggle_option(Game.SmoothRotation, 1);     break;
				case 13: Game.CDCamera		    = toggle_option(Game.CDCamera, 1);		     break;
				case 14: Game.CDStageTimer      = toggle_option(Game.CDStageTimer, 1);       break;
				case 17:						  toggle_option("fullscreen", "");			 break;
				case 18:						  toggle_option("size", 4);					 break;
				case 19:						  toggle_option("resolution", "");			 break;
				case 23:						  toggle_option("music", 10);				 break;
				case 24:						  toggle_option("sound", 10);				 break;
				default: break;
			}
			
			if Input.BPress
			{	
				// Reset state
				Game.UpdateAnimations = true; 
				SettingOption		  = 2;
				State				  = TitleState.Main; 
				
				palette_set_colour_range(TypePrimary, 0, 19, 1); 
				audio_sfx_play(sfxStarPost, false);
				
				// Save settings
				gametweaks_save(); gamesettings_save("config");
			}
		}
		break;
	}
}