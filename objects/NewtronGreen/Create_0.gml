/// @description Startup
// You can write your code in this editor
	
	// Initialise variables
	State   = 0;
	visible = false;
	
	// Set object properties
	object_set_hitbox(20, 16);
	object_set_unload(TypeReset);
	object_set_depth(Player, 0);