function ObjSuperStarStartup()
{
	// Intialsie flag
	State = 0;
	
	// Set object properties
	object_set_depth(Player, 1);
	animation_play(sprite_index, 2, 0, 5);
}