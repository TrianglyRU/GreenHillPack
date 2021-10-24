function ObjSpikeSingleStartup()
{
	// Set object solidbox
	object_set_solidbox(4, 16, false);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypePause);
}