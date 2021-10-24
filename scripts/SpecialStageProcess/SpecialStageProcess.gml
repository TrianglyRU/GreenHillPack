function SpecialStageProcess()
{
	switch State
	{
		case 0:
		{
			if !fade_check(FadeActive)
			{
				// Win
				if Input.ABCPress
				{
					State++;
					Game.SpecialState = 1;
					Game.SpecialScore = 10000;
			
					fade_perform(FadeTo, ColourWhite, 1);
					Game.Emeralds++;
			
					// Stop music
					audio_bgm_stop(PriorityLow,  0.5);
					audio_bgm_stop(PriorityHigh, 0.5);
				}
		
				// Lose
				else if Input.StartPress
				{
					State++;
					Game.SpecialState = 2;
					Game.SpecialScore = 1000;
			
					fade_perform(FadeTo, ColourWhite, 1);
			
					// Stop music
					audio_bgm_stop(PriorityLow,  0.5);
					audio_bgm_stop(PriorityHigh, 0.5);
				}
			}
		}
		break;
		case 1:
		{
			// Return to SS Screen to display results
			if fade_check(FadeMax)
			{
				room_goto(Screen_SStage);
			}
		}
		break;
	}
}