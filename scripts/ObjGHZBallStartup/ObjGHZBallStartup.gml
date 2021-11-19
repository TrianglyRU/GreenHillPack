function ObjGHZBallStartup()
{
	// Set variable
	PathDistance = 0;
	
	// Set object hitbox
	object_set_hitbox(20, 20);
	
	// Set object depth
	object_set_depth(GHZBoss, false);
	
	// Play animation
	animation_play(sprite_index, 1, 0, 0);
}