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
	SonicShift    = 88;
	StateOption   = 0;
	StateTimer    = 0;
	SettingOption = 2;
	State	      = TitleState.preRoll;
	LoadFlag      = TitleLoad.loadNone;
	
	// String data
	StringData =
	[
		"GAMEPLAY",
		"",
		"CHARACTER",
		"SPIN DASH",
		"SUPER PEEL OUT",
		"DOUBLE SPIN ATTACK",
		"ROLLJUMP CONTROL",
		"FLIGHT CANCEL",
		"SPEED CAP",
		"STAGE TRANSITIONS",
		"SMOOTH ROTATION",
		"CAMERA STYLE",
		"TIMER STYLE",
		"VIDEO",
		"",
		"FULLSCREEN",
		"WINDOW SIZE",
		"",
		"AUDIO",
		"",
		"MUSIC VOLUME",
		"SOUND VOLUME"
	];
	
	// Fade in
	fade_perform(ModeFrom, BlendBlack, 1);
}