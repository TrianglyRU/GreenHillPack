function GameCollisionsSetup()
{
	switch room
	{
		// Green Hill
		case Stage_GHZ1:
			tile_data_set("", 247, "CollisionLayerA", "CollisionLayerB");
		break;
		
		// Do not load any tiledata by default
		default:
			tile_data_set(noone, "", "", "");
		break;
	}
}