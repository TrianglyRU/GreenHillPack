function GameSetup()
{
	// Game settings	
	Game.WindowTitle	 = "Green Hill Revisited";
	Game.Version		 = 0;
	Game.StartRoom		 = Screen_SEGA;	
	Game.DevMode		 = false;
	Game.ShowSplash		 = true;
	Game.Width			 = 400;		// <- Default value. Can be overwritten by config file
	Game.Height			 = 224;
	Game.KeyboardControl = [vk_up, vk_down, vk_left, vk_right, ord("Z"), ord("X"), ord("C"), vk_space, vk_enter];
	
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
	Game.S1FloorCollision	= true;
	Game.SKWallCollision	= false;	
	Game.SKItemBoxBehaviour = false;
	Game.CDStageTimer	    = false;
	Game.StageTransitions   = true;
	Game.ElementalBarriers  = false;
	
	// Orbinaut improvements
	Game.SmoothRotation	      = false;
	Game.RichPresenceSupport  = true;
	Game.BetterPlayerTileGrip = false;
	Game.PreciseRingBehaviour = false;
	Game.NoRollSpeedLimit	  = false;
	Game.FlightCancel	      = false;

	// Initialise other variables	
	Game.Character		   = 0;
	Game.AnimationTime     = 0;
	Game.ActiveSave        = 0;
	Game.SaveData		   = 0;
	Game.SaveState         = 0;
	Game.FullscreenMode    = 0;
	Game.WindowSize	       = 3;
	Game.MusicVolume	   = 0;
	Game.SoundVolume	   = 0;
	Game.Score		       = 0;
	Game.Lives		       = 0;
	Game.Continues	       = 0;
	Game.Emeralds	       = 0;
	Game.Stage			   = 0;
	Game.StageRoom         = 0;
	Game.SpecialScore      = 0;
	Game.SpecialState      = 0;
	Game.DemoMode		   = 0;
	Game.DemoQueue		   = 0;
	Game.UpdateAnimations  = 0;
	Game.DiscordTime	   = 0;
	Game.IntroSequence     = 0;
	Game.DiscordEvent	   = "";
	Game.TransitionData    = [];
	Game.StarPostData      = [];
	Game.BonusStageData    = [];
	Game.SpecialRingData   = [];
	Game.SpecialRingList   = [];
	Game.DemoData		   = [];	
}