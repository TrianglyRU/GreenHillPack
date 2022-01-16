function InputDemoEnd()
{
	// If demo playback or recording has ended, exit demo mode!
	if DemoEnd						
	{
		if Camera.Enabled
		{
			// Stop music
			audio_bgm_stop(ChannelPrimary,   1.75); 
			audio_bgm_stop(ChannelSecondary, 1.75);
				
			// Fade out
			fade_perform(ModeInto, BlendBlack, 0.25); Camera.Enabled = false;
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
			room_goto(Screen_SEGA);
		}
	}
}