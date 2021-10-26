function ObjSolidWallStartup()
{
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypePause);
	
	// Set object solidbox
	object_set_solidbox(8, 32, false);
	
	// Set sprite
	switch WallType
	{
		case "Edge":
			image_index = 1;
		break;
		case "Bright":
			image_index = 2;
		break;
		case "Dark":
			image_index = 3;
		break;
	}
}