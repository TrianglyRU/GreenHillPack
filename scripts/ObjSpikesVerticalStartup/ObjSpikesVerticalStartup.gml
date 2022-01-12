function ObjSpikesVerticalStartup()
{
	// Define solidbox
	switch object_index
	{
		case SpikesVertical:
			var Solidbox = [20, 16];
		break;
		case SpikesVerticalSingle:
			var Solidbox = [4, 16];
		break;
		case SpikesVerticalWide: break;
		case SpikesVerticalLong: break;
	}
	
	// Set object properties
	object_set_solidbox(Solidbox[0], Solidbox[1], false);
	object_set_unload(TypePause);
	object_set_depth(Player, 0);
}