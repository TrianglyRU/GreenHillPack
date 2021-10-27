function ObjNewtronMain()
{
	switch State
	{
		// Appear
		case 0:
		{
			if !visible
			{
				if abs(floor(Player.PosX - PosX)) <= 128
				{
					animation_play(sprite_index, 20, 0, 4);
					visible = true;
				}
			}
			else if image_index == 3
			{
				// Increment state
				State++;
			}
			
			// Always face player
			image_xscale = floor(Player.PosX) < PosX ? 1 : -1;
		}
		break;
		
		// Fall
		case 1:
		{
			Ysp  += 0.21875;
			PosY += Ysp;
			
			var Distance = tile_check_collision_v(PosX, PosY + 16, true, false, LayerA)[0];
			if  Distance < 0
			{
				PosY += Distance;
				Ysp   = 0;
				
				// Update animation
				animation_play(spr_obj_newtron_fly, 3, 0, 0);
				
				// Increment state
				State++;
			}
		}
		break;
		
		// Fly & adhere to the floor
		case 2:
		{
			var Distance = tile_check_collision_v(PosX, PosY + 16, true, false, LayerA)[0];
			if  Distance >= -8 and Distance <= 12
			{
				PosY += Distance;
			}
			else
			{
				// Increment state
				State++;
			}
			PosX -= 2 * image_xscale;
		}
		break;
		
		// Fly without colliding with floor
		case 3:
		{
			PosX -= 2 * image_xscale;
		}
		break;
	}
	
	// Update position
	x = floor(PosX);
	y = floor(PosY);
	
	// Act as enemy
	if State >= 2
	{
		object_act_enemy(EnemyBadnik);
	}
}