/// @description Startup
// You can write your code in this editor
	
	/* Variable Definitions	
	1. Type, default = 100
	*/
	
	// Initialise variables
	StateTimer = 119;
	State	   = 0;	
	depth	   = 0;
	visible    = false;
	
	// Set object properties
	object_set_triggerbox(-16, 16, -16, 16);
	object_set_unload(TypePause);