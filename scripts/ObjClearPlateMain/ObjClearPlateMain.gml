function ObjClearPanelMain()
{
	// Exit if playing as different character
	if id.PlayerType == "Sonic & Tails" and Game.Character == CharKnuckles
	or id.PlayerType == "Knuckles"		and Game.Character != CharKnuckles
	{
		visible = false;
		exit;
	}
	
	switch State
	{
		// Idle
		case 0:
		{
			if floor(Player.PosX) > x
			{
				if Player.SuperState
				{
					// Restore stage music
					audio_bgm_play(ChannelPrimary, Stage.StageMusic);
					
					// Make player exit super form
					Player.SuperState = false;
				}
				Stage.TimeEnabled = false;
				Stage.IsFinished  = 1;
				
				// Increment state
				State++;
				
				// Play sound 
				audio_sfx_play(sfxClearPanel, false);
				
				// Set animation
				animation_play(SpriteData[0], 1, 0);
			}
		}
		break;
		case 1:
		{
			// Count timer
			StateTimer++;
		
			// Set animation
			if StateTimer == 62
			{
				animation_play(SpriteData[1], 1, 0);
			}
			
			// Increment state after 124 frames
			else if StateTimer == 123
			{
				State++;
				
				// Stop animation
				animation_set(sprite_index, 0);
			}
		
			// Create sparkles every 12 frames
			if StateTimer mod 12 == 0 and SparkleToUse < 8
			{
				instance_create(x + SparkleX[SparkleToUse], y + SparkleY[SparkleToUse], RingSparkle);
				SparkleToUse++;
			}
		}
		break;
		case 2:
		{
			/* S1 Behaviour */
			
			if !Game.StageTransitions
			{
				if Stage.IsFinished < 2
				{
					// Check if the player passed by the right boundary
					if floor(Player.PosX + Player.Xsp) > Stage.RightBoundary - 24
					{
						Stage.IsFinished = 2; 
						audio_bgm_play(ChannelPrimary, ActClear);
					}
				
					// Take away control from the player
					if Player.Grounded and !Input.IgnoreInput
					{
						Input.IgnoreInput = true;
					}
				}
				
				// Force player movement
				if Input.IgnoreInput
				{
					Input.Right = true;
				}
			}
			
			/* Transition Behaviour */
			
			else if Player.Grounded
			{
				if Stage.IsFinished < 2
				{
					if Game.Character == CharSonic
					{
						ClearAnim = choose(AnimClear, AnimClear, AnimClear, AnimClearAlt);
					}
					else
					{
						ClearAnim = AnimClear;
					}
					
					if ClearAnim == AnimClearAlt
					{
						Player.Xsp		=  1.5 * Player.Facing;
						Player.Ysp		= -3.25;
						Player.Grounded =  false;
						
						// Force animation
						Player.Animation = ClearAnim;
					}
					else
					{
						Player.Xsp = 0;
						Player.Ysp = 0;
					}
					Player.Inertia    = 0;
					Stage.IsFinished  = 2; 
					Input.IgnoreInput = true;
						
					// Play resuts music
					audio_bgm_play(ChannelPrimary, ActClear);
				}
				else if Player.Grounded
				{
					Player.Inertia = 0;
					Player.Xsp	   = 0;
					Player.Ysp	   = 0;
					
					// Force animation
					Player.Animation = ClearAnim;
				}
			}
			
			/* Original behaviour */
			
			/*if Player.Grounded
			{
				// Check if the player passed by the right boundary
				if floor(Player.PosX) > Stage.RightBoundary - 24
				{
					if Stage.IsFinished < 2
					{
						Stage.IsFinished = 2;
						
						// Play resuts music
						audio_bgm_play(ChannelPrimary, ActClear);
					}	
				}
				
				// Take away control from the player
				if !Input.IgnoreInput
				{
					Input.IgnoreInput = true;
				}
				else
				{
					Input.Right = true;
				}
			}*/
		}
	}
	
	// Update stage boundaries
	if !Stage.IsBossfight
	{
		if floor(Player.PosX) > (x - Game.Width * 1.5 + 64) + Game.Width / 2
		{
			Stage.TargetLeftBoundary  = x - Game.Width * 1.5 + 64;
			Stage.TargetRightBoundary = x + Game.Width / 2;
		
			if State
			{
				Stage.TargetLeftBoundary = x - (Game.Width / 2);
			}
		}
	}
}