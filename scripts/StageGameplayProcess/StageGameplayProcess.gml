function StageGameplayProcess()
{	
	// Process stage time
	if TimeEnabled
	{
		if (++Time) == 36000
		{
			if Game.DevMode
			{
				Time = 32400;
			}
			else
			{
				player_damage(false, false, true);
			}
		}	
	}
	
	// Process animated graphics
	if AnimatedGraphics != noone
	{	
		var Update = Game.UpdateAnimations; var Length = array_length(AnimatedGraphics);
		for (var i = 0; i < Length; i += 2)
		{
			if Update
			{
				var AnimSpeed = 1 / AnimatedGraphics[i + 1];
			}
			else
			{
				var AnimSpeed = 0;
			}
			sprite_set_speed(AnimatedGraphics[i], AnimSpeed, spritespeed_framespergameframe);
		}
	}
	
	// Process player death
	if Player.Death
	{
		/* In Sonic 3 and later, the game checks if player has fallen below
		   Camera.ViewY + Game.Height + 32 instead */
		
		if floor(Player.PosY) >= Stage.BottomBoundary + 32
		{	
			// If ran out of lives or time, start event
			if !RestartTimer
			{
				if !(--Player.Lives) or Time == 36000
				{
					RestartEvent = true;
					
					audio_bgm_stop(ChannelSecondary, 0);
					audio_bgm_play(ChannelPrimary, GameOver);
				}
			}
			RestartTimer++;
			
			// Wait for 1 (or 12 if event was triggered) seconds
			if RestartTimer == RestartEvent * 11 + 60
			{
				fade_perform(ModeInto, BlendBlack, 1);
				
				audio_bgm_stop(ChannelPrimary,   0.5);
				audio_bgm_stop(ChannelSecondary, 0.5);
				
				// Stop animations
				Game.UpdateAnimations = false;
			}
			
			// Check if we faded out
			if fade_check(StateMax)
			{	
				if Player.Lives != 0
				{
					if RestartEvent and array_length(Game.StarPostData)
					{
						Game.StarPostData[2] = 0;
					}
					Game.Lives = Player.Lives;
					
					// Restart the stage
					room_restart();
				}
				else
				{
					// Reset all saved data during the stage		
					Game.StarPostData    = [];
					Game.SpecialRingList = [];
					
					if Game.Continues
					{
						room_goto(Screen_Continue);
					}
					else
					{
						// Update game data of our save file
						if Game.ActiveSave != -1
						{
							Game.Lives     = 3;
							Game.Score     = 0;
							Game.Continues = 0;
							
							gamedata_save(Game.ActiveSave);
						}
						room_goto(Screen_DevMenu);
					}
				}
			}	
		}
		Camera.Enabled = false;
		UpdateObjects  = false;
		TimeEnabled    = false;
	}
}		