function AudioLooppointsSetup()
{
	/* The game will refer to data stored here if 'other' is set as a looppoint
	when calling audio_bgm_play() function */
	
	audio_bgm_setloop(GreenHill,		 14.45, 52.845);
	audio_bgm_setloop(SuperTheme,		 0,     54.38);
	audio_bgm_setloop(Boss,			     3.25,  28.84);
	audio_bgm_setloop(SpecialStageTheme, 11.66, 50.2);
	audio_bgm_setloop(BonusStageTheme,   3.67,  32.65);
}