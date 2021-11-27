/// @description Insert description here
// You can write your code in this editor
	
	/* Variable Definitions	
	1. Type, default = 100
	*/
	
	// Initialise state variable
	State	   = 0;
	StateTimer = 119;
	
	// Make object invisible
	visible = false;
	
	// Render above everything
	depth = 0;
	
	// Set object triggerbox
	object_set_triggerbox(-16, 16, -16, 16);
	
	// Set object unload type
	object_set_unload(TypePause);