function InputDemoEnd()
{
	// If stopped recording, exit. This is set if trying to pause the game, or 30 seconds have passed
	if DemoEnd						
	{
		if Camera.Enabled
		{
			fade_perform(ModeInto, BlendBlack, 0.5);
			
			audio_bgm_stop(ChannelPrimary,   0.5);
			audio_bgm_stop(ChannelSecondary, 0.5);
			
			Camera.Enabled = false;
		}
		if fade_check(StateMax)
		{
			if Game.DemoMode == DemoRecord
			{
				Game.DemoData = ButtonTimer;
			}
			Game.DemoMode = DemoMenu;
		
			// Reset all saved data during the stage		
			Game.StarPostData    = [];
			Game.SpecialRingList = [];
			Game.SpecialRingData = [];
			
			// Return to DevMenu
			room_goto(Screen_DevMenu);
		}
	}
}