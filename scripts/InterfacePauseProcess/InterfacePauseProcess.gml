function InterfacePauseProcess()
{
	/* Value table
	---------------
	Value[0] - Option
	Value[1] - Menu
	---------------
	*/
	
	if Stage.IsPaused
	{	
		// Loop through options
		if Input.DownPress
		{
			PauseValue = loop_value(PauseValue + 1, 0, 3); audio_sfx_play(sfxPauseSwitch, false);
		}
		else if Input.UpPress
		{
			PauseValue = loop_value(PauseValue - 1, 0, 3); audio_sfx_play(sfxPauseSwitch, false);
		}
	
		// React to action or start button
		if !fade_check(StateActive)
		{
			PauseTimer++;
			PauseTimer = PauseTimer mod 16;
			
			if (Input.StartPress or Input.ABCPress) then switch PauseValue
			{
				// Continue
				case 0:
				{
					Stage.IsPaused        = false;
					Stage.TimeEnabled     = true;
					Stage.UpdateObjects   = true;
					Camera.Enabled        = true;
					Game.UpdateAnimations = true;
					
					instance_activate_range(Camera.ViewX);
					
					audio_resume_all();
					audio_sfx_play(sfxPauseBack, false);
				}
				break;
					
				// Restart
				case 1: 
				{
					if Player.Lives > 1
					{
						fade_perform(ModeInto, BlendBlack, 1);
						
						audio_sfx_play(sfxPauseSelect, false);
					}
					else
					{
						audio_sfx_play(sfxFail, false);
					}
				}
				break;
					
				// Exit
				case 2: 
				{
					fade_perform(ModeInto, BlendBlack, 1);
					
					audio_sfx_play(sfxPauseSelect, false);
				}
				break;
			}
			
			// Clear input
			Input.StartPress = false;
			Input.ABCPress   = false;
		}
		if fade_check(StateMax)
		{
			// Restart the Stage
			if PauseValue == 1
			{
				Game.Lives -= 1;
				room_restart();						
			}
					
			// Exit to Title Screen
			else if PauseValue == 2
			{
				room_goto(Screen_Title);
						
				// Reset all data saved during the stage		
				Game.StarPostData    = [];
				Game.SpecialRingList = [];
			}
		}
	}
	else if Input.StartPress
	{
		// If we pressed start button and are allowed to pause, then pause!
		if CardValue[1] == 3 and !Stage.IsFinished and !Player.Death
		{
			// Do not react if in demo mode
			if Game.DemoMode
	        {
	            exit;
	        }
			
			Game.UpdateAnimations = false;
			Stage.UpdateObjects   = false;
			Stage.TimeEnabled     = false;
			Stage.IsPaused	      = true;
			Input.StartPress	  = false;
			Camera.Enabled        = false;
			
			audio_pause_all();
			audio_sfx_play(sfxPauseSelect, false);
		}
	}
}