function GameSetup()
{
	// Game settings
	Game.WindowTitle = "Green Hill Revisited";
	Game.DevMode     = true;
	Game.ShowSplash  = false;
	
	/* If set to false the game will load into the DevMenu, else into the room you choose.
	This won't work if Game.ShowSplash is enabled */
	Game.ForceLoad	 = Stage_GHZ1;	
	
	// Originals differences
	Game.SpindashEnabled    = true;
	Game.PeeloutEnabled		= false;
	Game.DropdashEnabled    = false;
	Game.DSpinAttackEnabled	= false;
	Game.GroundSpeedcap	    = false;
	Game.AirSpeedcap	    = false;
	Game.CDCamera			= false;
	Game.RolljumpControl    = false;
	Game.S3SlopePhysics		= false;
	Game.S3WaterPhysics		= false;
	Game.SKCrouch			= false;
	Game.SKRollDeceleration	= false;
	Game.S1FloorCollision	= false;
	Game.SKWallCollision	= false;	
	Game.SKItemBoxBehaviour = false;
	Game.CDStageTimer	    = false;	
	
	// Orbinaut improvements
	Game.SmoothRotation	      = true;
	Game.RichPresenceSupport  = false;
	Game.BetterPlayerTileGrip = true;
	Game.PreciseRingBehaviour = false;
	Game.NoRollSpeedLimit	  = false;
	Game.FlightCancel	      = false;
	
	/* Video, audio and control settings below are overwritten by 
	game settings if Developer Mode is disabled! */
	
	// Video settings
	Game.WindowFullscreen = false;
	Game.Width            = 400;
	Game.Height			  = 224;
	Game.WindowSize	      = 3;
	
	// Audio settings
	Game.MusicVolume = 0;
	Game.SoundVolume = 0.5;
	
	// Control settings (keyboard)
	Game.KeyboardControl = [vk_up, vk_down, vk_left, vk_right, ord("Z"), ord("X"), ord("C"), vk_space, vk_enter];
	
	// Initialise other variables
	Game.Character		 = 0;
	Game.GlobalTime		 = 0;
	Game.SpriteTimers    = 0;
	Game.ActiveSave      = 0;
	Game.SaveData		 = 0;
	Game.SaveState       = 0;
	Game.Score		     = 0;
	Game.Lives		     = 0;
	Game.Continues	     = 0;
	Game.Emeralds	     = 0;
	Game.Stage			 = 0;
	Game.StageRoom       = 0;
	Game.SpecialScore    = 0;
	Game.SpecialState    = 0;
	Game.DiscordTime	 = 0;
	Game.DiscordEvent	 = "";
	Game.StarPostData    = [];
	Game.BonusStageData  = [];
	Game.SpecialRingData = [];
	Game.SpecialRingList = [];
}