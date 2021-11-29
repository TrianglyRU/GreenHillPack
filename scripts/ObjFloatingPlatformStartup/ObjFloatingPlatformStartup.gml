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
			var XRadius	 = 40;
			var YRadius	 = 11;
			sprite_index = spr_obj_platform_ghz;
		}
		break;
		default:
		{
			var XRadius	 = 0;
			var YRadius	 = 0;
			sprite_index = spr_tempobject;
		}
		break;
	}
	
	// Set blank values
	Weight    = 0;
	State     = 0;
	Timer     = 0;
	FallSpeed = 0;
	
	// Set other variables
	OriginX = x;
	OriginY	= y;
	
	// Set object solidbox
	object_set_solidbox(XRadius, YRadius, false);
	
	// Set object unload type
	object_set_unload(TypePause);
	
	// Set object depth
	object_set_depth(Player, 0);
}