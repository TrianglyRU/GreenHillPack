function ScreenTitleProcess()
{
	/* Exit if fade is active. Notice that because of this we perform
	transition in the Draw End event !*/
	if fade_check(StateActive)
	{
		exit;
	}
	
	// Update palette
	palette_handle_range(TypePrimary, 0, 4, 4, 1, 6);
	
	// Play the music and scroll the background by moving the camera
	if Game.GlobalTime == 1
	{
		audio_bgm_play(ChannelPrimary, TitleTheme);
	}
	else if Game.GlobalTime > 42
	{
		Camera.PosX += 2;
	}
	
	// State Machine
	switch State
	{
		case TitleState.preRoll:
		{		
			/* if Game.GlobalTime > 408		// @TODO: Load demo files
			{
				LoadFlag = TitleLoad.loadDemo; fade_perform(ModeInto, BlendBlack, 1);
			}
			else */ if Input.StartPress
			{
				State = TitleState.Main; audio_sfx_play(sfxStarPost, false);
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
					Game.Character  =  choose(CharSonic, CharTails, CharKnuckles);
					Game.Emeralds   =  0;
					Game.Lives	    =  3;
					Game.Continues  =  0;
					Game.Score	    =  0;	
					Game.ActiveSave = -1;
					
					// Announce character
					switch Game.Character
					{
						case CharSonic:    CharSound = sfxVOSonic; break;
						case CharTails:    CharSound = sfxVOTails; break;
						case CharKnuckles: CharSound = sfxVOKnux;  break;
					}
					audio_sfx_play(CharSound,      false); 
					audio_sfx_play(sfxStarPost,    false);
					audio_bgm_stop(ChannelPrimary, 0.5);
						
					// Fade out
					LoadFlag = TitleLoad.loadStage; fade_perform(ModeInto, BlendBlack, 1);
				}
				break;
				case 1:
				{
					audio_sfx_play(sfxFail, false);
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
		}
		break;
	}
}