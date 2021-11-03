function ObjColomnPlatformStartup()
{
	// Remember initial position
	OriginY	= y;
	
	// Set object solidbox
	object_set_solidbox(32, 68, false);
	
	// Set object unload type
	object_set_unload(TypePause);
	
	// Set object depth
	object_set_depth(Player, false);
}