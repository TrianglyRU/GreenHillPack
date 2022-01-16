function ScreenTitleStartup()
{
	// Initialise enums
	enum TitleState
	{
		preRoll,
		Main,
		Settings,
		charSelect
	}
	enum TitleLoad
	{
		loadNone,
		loadStage,
		loadDemo,
		loadEnd
	}
	
	// Initialise variables
	SonicShift  = 88;
	StateOption = 0;
	CharSound   = 0;
	State	    = TitleState.preRoll;
	LoadFlag    = TitleLoad.loadNone;
	
	// Fade in
	fade_perform(ModeFrom, BlendBlack, 1);
}