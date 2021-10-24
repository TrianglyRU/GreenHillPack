function ObjBarrierStartup()
{
	// Set default sprite
	switch Player.BarrierType
	{
		case BarrierNormal:
			animation_set(spr_obj_barrier_normal, 0);
		break;
		case BarrierFlame:
			animation_set(spr_obj_barrier_flame, 0);
		break;
		case BarrierThunder:
			animation_set(spr_obj_barrier_thunder, 0);
		break;
		case BarrierWater:
			animation_set(spr_obj_barrier_water, 0);
		break;
	}
}