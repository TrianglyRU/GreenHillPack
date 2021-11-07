function GameAnimationProcess2()
{
	// Ignore in-built animation speed for all instances
	with all
	{
		if sprite_get_speed(sprite_index) != 0
		{
			sprite_set_speed(sprite_index, 0, spritespeed_framespergameframe);
		}
	}
}