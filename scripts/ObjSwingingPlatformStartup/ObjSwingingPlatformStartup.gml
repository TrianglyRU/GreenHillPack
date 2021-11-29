function ObjSwingingPlatformStartup()
{
	/* Variable Definitions	
	1. ChainCount, default = 4
	2. Speed,	   default = 1
	*/
	
	// Setup object
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			var XRadius	= 24;
			var YRadius	= 8;
			SpriteData  = [spr_obj_swingplatform_ghz, spr_obj_swingchain_ghz, spr_obj_swingtop_ghz];
		}
		break;
		default:
		{
			var XRadius = 0;
			var YRadius = 0;
			SpriteData  = [spr_tempobject, spr_tempobject, spr_tempobject];
					   /* [platform,	   chain,	       pendulum] */
		}
		break;
	}
	
	// Set blank values
	DistanceX = 0;
	DistanceY = 0;

	// Set other variables
    OriginX   = x;
    OriginY   = y;
    Amplitude = (ChainCount + 2) * 16 + sprite_get_width(SpriteData[0]) div 2;
    
	// Set object solidbox
    object_set_solidbox(XRadius, YRadius, false);
	
	// Set object depth
    object_set_depth(Player, 0);
}