function ObjSpringDiagonalStartup()
{
	// Define spring force
	if object_index == SpringYellowDiagonal
	{
		LaunchForce = 10;
	}
	else if object_index == SpringRedDiagonal
	{
		LaunchForce = 16;
	}
	
	// Define collision map
	CollisionMap = [32,32,32,32,32,32,32,32,32,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10];
	
	// Set object solidbox
	object_set_solidbox(16, 16, CollisionMap);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypePause);	
}