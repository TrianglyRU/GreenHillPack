function ObjSpikeBridgeStartup()
{
	// Set object hitbox
	object_set_hitbox(4, 16);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypePause);
}