function InterfacePauseProcess()
{
	/* Value table
	---------------
	Value[0] - Option
	Value[1] - Menu
	---------------
	*/
	
	// Check if stage is paused
	if Stage.IsPaused
	{	
		if !fade_check(StateActive)
		{
			// Pause timer
			PauseTimer = loop_value(PauseTimer + 1, 0, 16);
			
			// Loop through options
			if Input.DownPress
			{
				PauseValue = loop_value(PauseValue + 1, 0, 3);
				PauseTimer = 0;
			}
			else if Input.UpPress
			{
				PauseValue = loop_value(PauseValue - 1, 0, 3);
				PauseTimer = 0;
			}
	
			// React to action or start button
			if Input.StartPress or Input.ABCPress
			{
				switch PauseValue
				{
					// Return to stage
					case 0:
					{
						Stage.IsPaused = false;
						Camera.Enabled = true;
					
						// Activate objects
						instance_activate_range(Camera.ViewX);
					
						// Resume audio
						audio_resume_all();
					
					}
					break;
					
					// Restart the stage if we have more than 1 life
					case 1: 
					{
						if Player.Lives > 1
						{
							// Perform fade
							fade_perform(ModeInto, BlendBlack, 1);
						}
						else
						{
							// Play deny sound
							audio_sfx_play(sfxFail, false);
						}
					}
					break;
					
					// Exit the stage
					case 2: 
					{	
						// Perform fade
						fade_perform(ModeInto, BlendBlack, 1);
					}
					break;
				}
			
				// Clear input
				Input.StartPress = false;
				Input.ABCPress   = false;
			}
		}	
		else if fade_check(StateMax)
		{
			if PauseValue == 1
			{
				Game.Lives--;
				room_restart();
			}
			else if PauseValue == 2
			{
				// Reset all saved data during the stage		
				Game.StarPostData    = [];
				Game.SpecialRingList = [];
					
				// Return to title screen
				room_goto(Screen_Title);
			}	
		}
	}
	
	// If we pressed start button and are allowed to pause, then pause!
	else if Input.StartPress
	{
		if CardValue[1] == 3 and Stage.DoUpdate and !Stage.IsFinished
		{
			Input.StartPress = false;
			Camera.Enabled   = false;
			Stage.IsPaused	 = true;	
			
			// Stop all audio
			audio_pause_all();
		}
	}
}