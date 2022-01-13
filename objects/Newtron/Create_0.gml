/// @description Startup
// You can write your code in this editor

	// Initialise variables
	PosX    = x;
	PosY    = y;
	Ysp     = 0;
	State   = 0;
	visible = false;
	
	// Set object properties
	object_set_hitbox(20, 8);
	object_set_unload(TypeReset);
	object_set_depth(Player, 0);