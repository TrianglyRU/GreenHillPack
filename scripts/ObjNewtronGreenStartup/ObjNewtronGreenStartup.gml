function ObjNewtronGreenStartup()
{
	// Set variable
	State = 0;
	
	// Set object hitbox
	object_set_hitbox(20, 16);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypeReset);
	
	// Make object invisible
	visible = false;
}