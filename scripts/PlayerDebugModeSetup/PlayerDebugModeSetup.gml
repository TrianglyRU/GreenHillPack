function PlayerDebugModeSetup()
{
	// Exit the code if dev mode is disabled
	if !Game.DevMode
	{
		exit;
	}

	// Define debug objects list
	DebugList = 
	[
		Ring,
		ItemBox,
		Crabmeat,
		Buzzbomber,
		Chopper,
		SpikesVertical,
		FloatingPlatform,
		Dwayne,
		Motobug,
		SpringRedVertical,
		Newtron,
		SolidWall,
		StarPost,
		SpecialRing,	
		
		// Placeholder object, that will grant (or revoke) emeralds
		Player
	];
}