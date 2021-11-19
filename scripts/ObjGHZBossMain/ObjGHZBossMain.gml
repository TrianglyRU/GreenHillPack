function ObjGHZBossMain()
{
	// Switch betweens states
	if !(--StateTimer)
	{
		if State == 6
		{
			State = 5;
		}
		else if State < 10
		{
			State++;
		}
		switch State
		{
			// Appearing, moving down
			case 1:
			{
				StateTimer = 172;
				Ysp		   = 1;
			}
			break;
			
			// Appearing, moving left
			case 2:
			{
				StateTimer = 96;
				Xsp		   = -1.415; //-1; 
				Ysp		   = -0.25;
				
				// Play animation
				animation_play(sprite_index, 4, 7, 7);
			}
			break;
			
			// Idle, launching ball attachement
			case 3:
			{
				StateTimer = 120;
				Xsp		   = 0;
				Ysp		   = 0;
				
				// Create ball object (TODO);
				instance_create(x, y, GHZBossBall);
					
				// Stop animation
				animation_set(sprite_index, 0);
			}
			break;
			
			// Moving to the left slowly
			case 4:
			{
				StateTimer = 128;
				Xsp		   = -0.5625; //-0.25;
				
				// Play animation
				image_index = 7;
				animation_play(sprite_index, 4, 0, 7);
			}
			break;
			
			// Turning, idle
			case 5:
			{
				StateTimer    = 64;
				Xsp		      = 0;
				image_xscale *= -1;
				
				// Stop animation
				animation_set(sprite_index, 0);
			}
			break;
			
			// Side-to-side movement
			case 6:
			{
				StateTimer = 64;
				Xsp		   = 2.25 * -image_xscale; //1 * -image_xscale;
				
				// Play animation
				image_index = 7;
				animation_play(sprite_index, 4, 0, 7);
			}
			break;
			
			/* State 7: Destuction, set by the code below */
			
			// Defeat
			case 8:
			{
				StateTimer   = 96;
				image_xscale = -1;
			}
			break;
			
			// Runaway
			case 9:
			{
				OffsetY = 0;
				Xsp		= 4;
				Ysp		= -0.25;
				
				// Play animation
				image_index = 1;
				animation_play(sprite_index, 3, 0, 7);
				
				// Boss defeated now. Set flag
				BossTrigger.BossDefeated = true;
			}
			break;
			
			// Despawn
			case 10:
			{
				if !object_is_onscreen(id)
				{
					instance_destroy();
				}
			}
		}
	}
	
	// Launch chain and ball
	if State == 3
	{
		ChainOffset += StateTimer > 96
	}
	
	// Update attachemnt angle
	else if State > 3 and State < 7
	{
		Angle++;
	}
	
	// Spawn explosions on Eggmobile and Ball
	else if State == 7
	{
		if !(--ExplosionTimer)
		{
			if instance_exists(GHZBossBall)
			{
				instance_create(GHZBossBall.x + irandom_range(-32, 32), GHZBossBall.y + irandom_range(-32, 32), FireExplosion);
			}
			instance_create(x + irandom_range(-32, 32), y + irandom_range(-32, 32), FireExplosion);
			
			// Reset timer
			ExplosionTimer = irandom_range(0, 16);
		}
		if (StateTimer + 1) mod 8 == 0
		{
			audio_sfx_play(sfxExplosion, false);
		}
		
		// Destroy ball after 96 frames
		if StateTimer == 84
		{
			instance_destroy(GHZBossBall);
		}
	}
	
	// Make Eggman drop on State 8
	else if State == 8
	{
		if StateTimer >= 58
		{
			Ysp = StateTimer != 58 ? Ysp + 0.09375 : 0;
		}
		else if StateTimer > 8
		{
			Ysp -= 0.03125;
		}
		else
		{
			Ysp = 0;
		}
	}
	
	// Move object
	if State > 1 and State != 7
	{
		OffsetY = (OffsetY + 2) mod 360;
	}
	PosX += Xsp;
	PosY += Ysp + dsin(OffsetY) / 8.14;
	
	// Update position
	x = floor(PosX);
	y = floor(PosY);
	
	// Decrease invincibility timer and flash palette
	if InvincibilityTime
	{
		if (--InvincibilityTime) mod 2 == 0
		{
			palette_set_colour(PaletteDry, 16, 1, 1);
		}
		else
		{
			palette_set_colour(PaletteDry, 16, 1, 2);
		}
	}
	
	// Act as boss (damage player or be damaged)
	if HP and !InvincibilityTime and object_act_enemy(EnemyBoss)
	{
		if !(--HP)
		{
			StateTimer	   = 180;
			State		   = 7;
			Xsp		       = 0;
			Ysp			   = 0;
			OffsetY		   = 0;
			ExplosionTimer = irandom_range(2, 34);
			
			// Force stop damage sound
			audio_sfx_stop(sfxBossHit);
			
			// Stop animation
			animation_set(sprite_index, 0);
			
			// Spawn explosions on chain
			var DistanceA = dsin((Stage.OscillateAngle * -Angle) mod 360);
			var DistanceX = dcos(90 + DistanceA * 90) * 16;
			var DistanceY = dsin(90 + DistanceA * 90) * 16;
			
			for (var i = 1; i < 5; i++)
		    {
		        var X = floor(x +				    DistanceX * i);
		        var Y = floor(y + 8 + ChainOffset + DistanceY * i);
			
		        instance_create(X, Y, FireExplosion);
		    }
			instance_create(x, y + 8 + ChainOffset, FireExplosion);
		}
		else
		{
			InvincibilityTime = 31;
			
			// Set palette
			palette_set_colour(PaletteDry, 16, 1, 2);
		}
	}
}