function ObjSpikesHorizontalMain()
{	
	// Do collision
	object_act_solid(true, true, true, false);
	
	// Damage player if they're touching hurt side
	var HurtSide = image_xscale == 1 ? SideRight : SideLeft;
	if object_check_touch(HurtSide)
	{
		player_damage(false, false, false);
	}
}