function PlayerDebugModeDisplay()
{
	if !DebugMode
	{
		return false;
	}
	else
	{
		// Switch between objects
		if Stage.DoUpdate
		{
			switch DebugList[DebugItem]
			{
				case Ring:
					animation_set(spr_obj_ring, 0);
				break;
				case SpecialRing:
					animation_set(spr_obj_specialring, 0);
				break;
				case Crabmeat:
					animation_set(spr_obj_crabmeat_move, 0);
				break;
				case ItemBox:
					animation_set(spr_obj_itembox, 0);
				break;
				case SpikesVertical:
					animation_set(spr_obj_spikesvertical, 0);
				break;
				case SpringRedVertical:   
					animation_set(spr_obj_spring_red_v, 0);  
				break;
				case StarPost:
					animation_set(spr_obj_starpost, 0);		  
				break;
				case FloatingPlatform:
					animation_set(spr_obj_platform_ghz, 0);
				break;
				case Buzzbomber:
					animation_set(spr_obj_buzzbomber_idle, 0);
				break;
				case Newtron:
					animation_set(spr_obj_newtron_fall, 1);
				break;
				case SolidWall:
					animation_set(spr_obj_solidwall, 1);
				break;
				case Dwayne:
					animation_set(spr_obj_dwayne, 1);
				break;
				case Chopper:
					animation_set(spr_obj_chopper, 0);
				break;
				case Motobug:
					animation_set(spr_obj_motobug, 0);
				break;
				case Player:
					animation_set(tex_sstage_reward, 0);
				break;
			}
		}
		
		// Update player
		x			 = floor(PosX);
		y			 = floor(PosY);
		image_xscale = Player.Facing;
		image_angle  = 360;
	
		// Draw player
		draw_self();
		
		// Return active debug mode
		return true;
	}
}