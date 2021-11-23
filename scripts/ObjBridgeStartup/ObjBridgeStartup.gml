function ObjBridgeStartup()
{
	/* Variable Definitions	
	1. BridgeLength,  default = 12
	2. GeneratePosts, default = true
	3. BridgeSprite,  default = spr_obj_bridge_log_template
	4. PostSprite,    default = spr_obj_bridge_post_template
	*/
	
	// Set blank values
	RecoveryAngle    = 0;
	ActiveSegment    = 0;
	ActiveDepression = 0;
	
	// Set other variables
	NativeY = y;
	x += (BridgeLength / 2 - 6) * 16;
	
	// Calculate log depression value
	for (var i = 0; i < BridgeLength; i++) 
	{
		LogDepression[i] = (i < BridgeLength / 2 ? i : BridgeLength - i - 1) * 2 + 2;
	}
	
	// Set object solidbox
	object_set_solidbox(BridgeLength / 2 * 16, 7, false);
	
	// Set object depth
	object_set_depth(Player, true);
	
	// Set object unload type
	object_set_unload(TypePause);
}