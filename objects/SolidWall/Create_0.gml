/// @description Startup
// You can write your code in this editor

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
	
	// Set object properties
	object_set_solidbox(8, 32, false);
	object_set_unload(TypePause);
	object_set_depth(Player, 0);