function GameCollisionsSetup()
{
	switch room
	{
		// GHZ
		case Stage_GHZ1:
			tile_data_set("GHZ", 247, "CollisionLayerA", "CollisionLayerB");
		break;
		
		// Default
		default:
			tile_data_set("", 146, "CollisionLayerA", "CollisionLayerB");
		break;
	}
}