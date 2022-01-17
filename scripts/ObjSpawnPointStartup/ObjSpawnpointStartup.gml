function ObjSpawnPointSetup()
{
	/* Variable Definitions	
	1. PlayerType, default = "All"					
	*/
	
	// Destroy if we should perform stage transition
	if !array_equals(Game.TransitionData, [])
	{
		instance_destroy(); exit;
	}
	
	// Check if player should use spawnpoint to spawn
	if !Player.PosX and !Player.PosY
	{
		if PlayerType == "Sonic & Tails" and Game.Character == CharKnuckles
		or PlayerType == "Knuckles"		 and Game.Character != CharKnuckles
		{
			exit;
		}
		
		// Set player and camera positions
		Player.PosX = x;
		Player.PosY = y - Player.RadiusY - 1;
			
		Camera.PosX = Player.PosX - Game.Width  / 2;
		Camera.PosY = Player.PosY - Game.Height / 2 + 16;
	}

	// Remove self
	instance_destroy();
}