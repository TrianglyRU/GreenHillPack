function ObjSpringRampStartup()
{
	// Create variables
	JumpTimer  = 0;
	MapDefault = [];
	MapPressed = [];
	
	// Define collision maps
	MapDefault = [0,0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,8,8,9,9,10,10,11,11,12,12,12,12,13,13,13,13,14,14,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16];
	MapPressed = [0,1,1,2,2,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,8,8,8,8,7,7,7,7,6,6,6,6,5,5,5,5,5,5,5];
	
	// Set object solidbox
	object_set_solidbox(29, 8, MapDefault);
	
	// Set object depth
	object_set_depth(Player, true);
	
	// Set object unload type
	object_set_unload(TypePause);
}