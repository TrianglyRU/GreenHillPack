/// @description Startup
// You can write your code in this editor
	
	// Select sound
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			SustainSound = sfxWaterfall;
		}
		break;
		default: break;
	}
	
	// Make object invisible
	visible = false;
	
	// Set object properties
	object_set_unload(TypePause);