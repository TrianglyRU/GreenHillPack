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
		SpecialRing,
		ItemBox,
		SpikesVertical,
		SpikesHorizontal,
		SpringYellowVertical,
		SpringYellowHorizontal,
		SpringYellowDiagonal,
		SpringRedVertical,
		SpringRedHorizontal,
		SpringRedDiagonal,
		SpringRamp,
		StarPost,
		AirBubbler,
		PushableBlock,
		FloatingPlatform,
		SwingingPlatform,	
		Bridge,
		Animal,
		SignPost,
		EggPrison,
		
		// Placeholder object, that will grant (or revoke) emeralds
		Player
	];
}