function ObjBridgeStartup()
{
	/* Variable Definitions	
	1. BridgeLength,  default = 12
	2. GeneratePosts, default = true
	*/

	// Setup object
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
			SpriteData = [spr_obj_bridge_log_ghz, spr_obj_bridge_post_ghz];
		break;
		default:
			SpriteData = [spr_tempobject, spr_tempobject];
					  /* [log,		      post] */
		break;
	}
	
	// Initialise variables
	x				 += (BridgeLength / 2 - 6) * 16;
	NativeY			 = y;
	RecoveryAngle    = 0;
	ActiveSegment    = 0;
	ActiveDepression = 0;
	
	// Calculate log depression value
	for (var i = 0; i < BridgeLength; i++) 
	{
		LogDepression[i] = (i < BridgeLength / 2 ? i : BridgeLength - i - 1) * 2 + 2;
	}
	
	// Set object properties
	object_set_solidbox(BridgeLength / 2 * 16, 7, false);
	object_set_unload(TypePause);
}