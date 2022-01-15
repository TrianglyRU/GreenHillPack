/// @description Main
// You can write your code in this editor
	
	// Check for overlap
	if Game.Character == CharKnuckles or (Player.Spinning and Player.Grounded and abs(Player.Xsp) >= 4)
	{		
		if object_check_overlap(TypeSolidbox)
		{
			for (var i = 0; i < 2; i++)
			{
				for (var j = 0; j < 4; j++)
				{
					// Set speeds
					switch j
					{
						case 0: var YVel = i < 0 ? -6 : -5; break;
						case 1: var YVel = i < 0 ? -2 : -1; break;
						case 2: var YVel = i < 0 ?  2 :  1; break;
						case 3: var YVel = i < 0 ?  6 :  5; break;
					}
					if floor(Player.PosX) > x 
					{
						var XVel = i ? 6 : 4;
					}
					else
					{
						var XVel = i ? -4 : -6;
					}
	
					// Apply speed
					with PieceID[i, j]
					{
						Xsp = XVel;
						Ysp = YVel;
						Grv = 0.21875;
						
						// Update object unload type
						object_set_unload(TypeDelete);
					}
				}
			}
			
			// "Stop" player for this frame
			Player.PosX -= Player.Xsp;
			
			// Play sound
			audio_sfx_play(sfxLedgeBreak, false);
			
			// Destroy object
			instance_destroy();
		}
	}
	
	// Do collision
	else
	{
		object_act_solid(true, false, false, false);
	}