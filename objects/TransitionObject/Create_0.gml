/// @description Startup
// You can write your code in this editor
	
	/* Variable Definitions	
	1. PlayerType, default = "All"					
	*/
	
	// Destroy if we do not need to perform stage transition
	if array_equals(Game.TransitionData, [])
	{
		instance_destroy();
	}
	else
	{
		// Match character	
		if PlayerType == "Sonic & Tails" and Game.Character == CharKnuckles
		or PlayerType == "Knuckles"		 and Game.Character != CharKnuckles
		{
			exit;
		}
	
		// Update left boundary
		Stage.LeftBoundary       = x - Game.Width / 2;
		Stage.TargetLeftBoundary = x - Game.Width / 2;
	
		// Setup player
		Player.PosX		   = x + Game.TransitionData[0];
		Player.PosY	       = y - Player.RadiusY - 1;	
		Player.BarrierType = Game.TransitionData[2]; 
		Player.Grounded	   = true;
		
		if Player.BarrierType
		{
			instance_create(Player.PosX, Player.PosY, Barrier);
		}
		
		// Setup camera
		Camera.PosX    = x - Game.Width / 2;
		Camera.PosY	   = y - Game.TransitionData[1] + 1;
		Camera.Enabled = false;	
	}
	
	// Set object properties
	object_set_unload(TypeDelete);
	object_set_depth(Player, 0);