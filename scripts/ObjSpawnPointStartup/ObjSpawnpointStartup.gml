function ObjSpawnPointSetup()
{
	/* Variable Definitions	
	1. PlayerType, default = "All"					
	*/
	
	// Check if player should use spawnpoint to spawn
	if !Player.PosX and !Player.PosY
	{
		// Check which spawnpoint player should use
		if PlayerType == "Sonic & Tails" and Game.Character == CharKnuckles
		or PlayerType == "Knuckles"		 and Game.Character != CharKnuckles
		{
			exit;
		}
		
		// Set player position on spawnpoint
		Player.PosX = x;
		Player.PosY = y - Player.RadiusY - 1;
			
		// Set camera
		Camera.PosX = Player.PosX - Game.Width  / 2;
		Camera.PosY = Player.PosY - Game.Height / 2 + 16;
	}

	// Remove self
	instance_destroy();
}