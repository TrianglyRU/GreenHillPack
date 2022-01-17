/// @description Main
// You can write your code in this editor
	
	switch State
	{
		// Appear
		case 0:
		{
			if !visible 
			{
				if abs(floor(Player.PosX - x)) <= 128
				{
					animation_play(sprite_index, [20, 40, 20, 40, 20, 0], 5);
					visible = true;
					
					// Always face player
					image_xscale = floor(Player.PosX) < x ? 1 : -1;
					
					// Increment state
					State++;
				}
			}
		}
		break;
		
		// Shoot
		case 1:
		{
			if image_index == 2
			{
				var  ThisObject = [id, image_xscale];
				var  NewObject  = instance_create(x - 20 * image_xscale, y - 8, Projectile);
				with NewObject
				{
					Grv			 = 0;
					Xsp          = -2 * ThisObject[1];
					sprite_index = spr_obj_projectile_buzzbomber;
					
					// Set object depth
					object_set_depth(ThisObject[0], true);
				}
				
				// Increment state
				State++;
			}
		}
		break;
		
		// Disappear
		case 2:
		{
			if image_index == 5
			{
				instance_destroy();
			}
		}
		break;
	}
	
	// Act as enemy
	if image_index and image_index < 4
	{
		object_act_enemy(TypeBadnik);
	}