/// @description Draw
// You can write your code in this editor
	
	if State < 7
	{
		// Draw rocker
		if State == 3 and StateTimer < 110 or State > 3
		{
			draw_animated_sprite(spr_obj_boss_rocker, 8, StateTimer, x, y + 8 + ChainOffset);
		}
		
		// Draw static chains
		if State == 3
		{
			for (var i = 0; i < 4; i++)
			{
				if StateTimer < 100 - 16 * i
				{
					draw_sprite(spr_obj_swingchain_ghz, 0, x, y + 48 + 16 * i);
				}
			}
		}
		
		// Draw moving chains
		else if State > 3
		{
			// Calculate oscillate data
			var DistanceA = dsin((Stage.OscillateAngle * -Angle) mod 360);
			var DistanceX = dcos(90 + DistanceA * 90) * 16;
			var DistanceY = dsin(90 + DistanceA * 90) * 16;
		
			// Draw now
		    for (var i = 1; i < 5; i++)
		    {
		        var X = floor(x +				    DistanceX * i);
		        var Y = floor(y + 8 + ChainOffset + DistanceY * i);
			
		        draw_sprite(spr_obj_swingchain_ghz, 0, X, Y);
		    }
		}
	}
	
	// Draw ball
	with GHZBossBall
	{
		draw_self();
	}
	
	// Draw eggmobile
	draw_self();
	
	// Draw Eggman
	if HP
	{
		if InvincibilityTime
		{
			draw_sprite_ext(spr_obj_boss_eggman_hurt, 0, x, y, image_xscale, 1, 0, -1, 1);
		}
		else if Player.Hurt or Player.Death or State == 3
		{
			draw_animated_sprite_ext(spr_obj_boss_eggman_laugh, 5, StateTimer, x, y, image_xscale, 1);
		}
		else
		{
			draw_animated_sprite_ext(spr_obj_boss_eggman_idle, 6, StateTimer, x, y, image_xscale, 1);
		}
	}
	else switch State
	{
		case 7:
			draw_animated_sprite_ext(spr_obj_boss_eggman_hurt2, 31, StateTimer, x, y, image_xscale, 1);
		break;
		case 8:
			draw_sprite_ext(spr_obj_boss_eggman_defeat, 0, x, y, image_xscale, 1, 0, -1, 1);
		break;
		case 9:
		case 10:
			draw_animated_sprite_ext(spr_obj_boss_eggman_idle, 6, abs(StateTimer), x, y, image_xscale, 1);
		break;
	}