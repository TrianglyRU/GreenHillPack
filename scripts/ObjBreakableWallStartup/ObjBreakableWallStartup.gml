function ObjBreakableWallStartup()
{
	/* Variable Definitions	
	1. Type, default = "Default"
	*/
	
	// Setup object
	switch room
	{
		default:
			SpriteData = spr_obj_breakablewall_piece;
		break;
	}
	var ThisData = SpriteData;
	
	// Create pieces
	for (var i = 0; i < 2; i++)
	{
		for (var j = 0; j < 4; j++)
		{
			// Get sprite index to display
			if Type == "Bright" and i == 0
			{
				var Index = 0;
			}
			else if Type == "Dark" and i == 1
			{
				var Index = 2;
			}
			else
			{
				var Index = 1;
			}
			
			// Create piece
			var  Object = instance_create(x - 8 + i * 16, y - 24 + j * 16, BreakableWallPiece);
			with Object
			{
				Object.sprite_index = ThisData;
				Object.image_index  = Index;
			}
			PieceID[i, j] = Object;
		}
	}
	
	// Set object solidbox
	object_set_solidbox(16, 32, false);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypePause);
}