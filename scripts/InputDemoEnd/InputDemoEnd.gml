function InputDemoEnd()
{
	// If demo playback or recording has ended, exit demo mode!
	if DemoEnd						
	{
		if Camera.Enabled
		{
			// Fade out
			if Game.IntroSequence
			{
				fade_perform(ModeInto, BlendWhite, 1);
			}
			else
			{
				audio_bgm_stop(ChannelPrimary,   1); 
				audio_bgm_stop(ChannelSecondary, 1);
				
				fade_perform(ModeInto, BlendBlack, 0.5);
			}
			Camera.Enabled = false;
		}
		else if fade_check(StateMax)
		{
			if Game.DemoMode == DemoRecord
			{
				Game.DemoData = ButtonTimer;
			}
			Game.DemoMode = false;
		
			// Reset all data saved during the stage		
			Game.StarPostData    = [];
			Game.SpecialRingList = [];
			Game.SpecialRingData = [];
			
			// Return to SEGA screen
			if Game.IntroSequence
			{
				room_goto(Screen_Title);
			}
			else
			{
				room_goto(Screen_SEGA);
			}
		}
	}
}