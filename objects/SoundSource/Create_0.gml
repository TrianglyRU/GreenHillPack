/// @description Insert description here
// You can write your code in this editor
	
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
	
	visible = false;
	
	object_set_unload(TypePause);