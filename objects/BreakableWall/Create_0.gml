/// @description Startup
// You can write your code in this editor
	
	/* Variable Definitions	
	1. Type, default = "Default"
	*/
	
	// Setup object
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
			var SpriteData = spr_obj_breakablewall_ghz;
		break;
		default:
			var SpriteData = spr_tempobject;
		break;
	}
	
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
			
			// Create pieces
			var  Object = instance_create(x - 8 + i * 16, y - 24 + j * 16, BreakableWallPiece);
			with Object
			{
				Object.sprite_index = SpriteData;
				Object.image_index  = Index;
			}
			PieceID[i, j] = Object;
		}
	}
	
	// Set object properties
	object_set_solidbox(16, 32, false);
	object_set_unload(TypePause);
	object_set_depth(Player, 0);