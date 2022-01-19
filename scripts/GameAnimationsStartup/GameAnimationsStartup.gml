function GameAnimationsStartup()
{
	// Initalise animation variables for all instances that do not have them
	with all if !variable_instance_exists(id, "image_duration")
	{
		image_timer     = 0;
		image_duration  = 0;
		image_loopframe = 0;
		image_speed     = 0;
	}
	
	// Create data structure for animation timers
	if !ds_exists(Game.AnimationTime, ds_type_map)
	{
		Game.AnimationTime = ds_map_create();
	}
	ds_map_add(Game.AnimationTime, GlobalTime, 0);
}