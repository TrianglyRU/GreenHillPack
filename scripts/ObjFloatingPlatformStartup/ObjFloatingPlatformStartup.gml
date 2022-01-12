function ObjFloatingPlatformStartup()
{
	/* Variable Definitions	
	1. Speed,        default = 1
	2. Distance,     default = 64
	3. MovementType, default = "None"
	4. InverseX,	 default = false
	5. InverseY,	 default = false
	6. DoFall,       default = false
	*/
	
	// Setup object
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			var Solidbox = [32, 8];
			sprite_index = spr_obj_floatingplatform_ghz;
		}
		break;
		default:
		{
			var Solidbox = [0, 0];
			sprite_index = spr_tempobject;
		}
		break;
	}
	
	// Initialise variables
	OriginX   = x;
	OriginY	  = y;
	Weight    = 0;
	State     = 0;
	Timer     = 0;
	FallSpeed = 0;
	
	// Set object properties
	object_set_solidbox(Solidbox[0], Solidbox[1], false);
	object_set_unload(TypePause);
	object_set_depth(Player, 0);
}