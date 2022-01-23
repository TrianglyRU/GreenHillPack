function ObjItemBoxMain()
{
	switch State
	{
		// Not destroyed
		case 0:
		{
			// Handle item card flick
			if !(--Timer)
			{
				Timer = 5;
			}

			// Check if player is able to destroy it
			if Game.SKItemBoxBehaviour
			{
				if Player.Ysp < 0 and !Player.DoubleSpinAttack
				{
					var Check = floor(Player.PosY + 16) >= y;
				}
				else
				{
					var Check = true;
				}
			}
			else
			{
				var Check = Player.Ysp >= 0 or Player.DoubleSpinAttack;
			}
			if Check and (Player.Spinning or Player.GlideState > GlideFall) and Player.OnObject != id
			{
				// Destroy on overlap
				if object_check_overlap(TypeHitbox2)
				{
					// Inverse player's speed
					if !Player.Grounded
					{
						Player.Ysp = -Player.Ysp;
					}
					
					// Create explosion
					instance_create(PosX, PosY, DustExplosion);
					audio_sfx_play(sfxDestroy, false);
				
					// Temporary do not unload the object
					object_set_unload(false);	

					// Increment state
					Timer = 0;
					State++;
				}
			}
				
			// If not, just collide
			else
			{
				// Do collision
				object_act_solid(true, true, false, false);
					
				// Make itembox fall down
				if !IsFalling and floor(Player.PosY) >= floor(y + 16)
				{
					if object_check_overlap(TypeHitbox)
					{
						IsFalling  = true;
						Ysp        = -1.5;
						Player.Ysp = -Player.Ysp;
					}
				}
			}
		
			// Check if itembox is airborne
			if IsFalling
			{
				// Move
				Ysp  += 0.21875;
				PosY += Ysp;
			
				// Collide with floor
				var FindFloor = tile_find_v(PosX, PosY + 15, true, false, Player.Layer)[0];
				if  FindFloor < 0
				{
					PosY     += FindFloor;
					IsFalling = false;
				}
			
				// Update position
				x = floor(PosX);
				y = floor(PosY);
			}
			
			// Update card position
			CardX = x;
			CardY = y - 3;
		}
		break;
		
		// Destroyed
		case 1:
		{	
			// Update animation
			if (++Timer) == 12
			{
				animation_set(spr_obj_itembox_destroyed, 0);
			}
			
			// Move item card
			CardSpeed = max(CardSpeed - 0.09375, 0);
			CardY	 -= CardSpeed;
			
			// If card is moving, exit
			if CardSpeed 
			{
				break;
			}
			
			// Increment state
			Timer = 30;
			State++;
			
			// Give bonus
			switch BoxType
			{
				case "10 Rings":
				{
					Player.Rings += 10; audio_sfx_play(Player.Rings mod 2 == 0 ? sfxRingLeft : sfxRingRight, false);
				}
				break;
				case "High Speed":
				{
					if !Player.SuperState
					{
						audio_bgm_play(ChannelPrimary, HighSpeed_FM);
					}
					Player.HighspeedBonus = 1200;
				}
				break;
				case "Invincibility":
				{
					if Player.SuperState
					{
						break;
					}
					Player.InvincibleBonus = 1200; instance_create(Player.PosX, Player.PosY, InvincibilitySparkles);
						
					// Play music
					audio_bgm_play(ChannelPrimary, Invincibility_FM);
				}
				break;
				case "Barrier":
				{
					Player.BarrierType = BarrierNormal;
					
					if !instance_exists(Barrier)
					{
						instance_create(Player.PosX, Player.PosY, Barrier);
					}
					else with Barrier
					{
						// If barrier exists, update properties
						object_set_depth(Player, 1); animation_play(spr_obj_barrier_normal, 2, 0);
					}
					audio_sfx_play(sfxBarrier, false);
				}
				break;
				case "Flame Barrier":
				{
					Player.BarrierType = BarrierFlame;
					
					if !instance_exists(Barrier)
					{
						instance_create(Player.PosX, Player.PosY, Barrier);
					}
					else with Barrier
					{
						// If barrier exists, update animation
						animation_play(spr_obj_barrier_flame, 2, 0);
					}
					audio_sfx_play(sfxFlameBarrier, false);
				}
				break;
				case "Thunder Barrier":
				{
					Player.BarrierType = BarrierThunder;
					
					if !instance_exists(Barrier)
					{
						instance_create(Player.PosX, Player.PosY, Barrier);
					}
					else with Barrier
					{
						// If barrier exists, update animation
						animation_play(spr_obj_barrier_thunder, 2, 0);
					}
					audio_sfx_play(sfxThunderBarrier, false);
				}
				break;
				case "Water Barrier":
				{
					Player.BarrierType = BarrierWater;
					
					if !instance_exists(Barrier)
					{
						instance_create(Player.PosX, Player.PosY, Barrier);
					}
					else with Barrier
					{
						// If barrier exists, update properties
						object_set_depth(Player, 1); animation_play(spr_obj_barrier_water, 2, 0);
					}
					audio_sfx_play(sfxWaterBarrier, false);
						
					// Play previous track if running out of air
					if Player.AirTimer <= 720
					{	
						if !Player.SuperState
						{
							if Player.InvincibleBonus
							{
								audio_bgm_play(ChannelPrimary, Invincibility_FM);
							}
							else if Player.HighspeedBonus
							{
								audio_bgm_play(ChannelPrimary, HighSpeed_FM);
							}
							else
							{
								audio_bgm_play(ChannelPrimary, Stage.StageMusic);
							}
						}
						else
						{
							audio_bgm_play(ChannelPrimary, SuperTheme);
						}
					}
			
					// Reset air timer
					Player.AirTimer = 1800;
				}
				break;
				case "Extra Life":
				{
					Player.Lives++; audio_bgm_play(ChannelSecondary, ExtraLife);
				}
				break;
				case "Eggman":
				{
					player_damage(false, false, false);
				}
				break;
			}
		}
		break;
		
		// Display card for 30 frames
		case 2:
		{
			if !(--Timer)
			{
				State++;
			}
			
			// Update object properties
			object_set_unload(TypePause);
		}
		break;
	}
}