function AudioLooppointsSetup()
{
	/* The game will refer to data stored here to loop the tracks. 
	If no data set here for the track, it won't be looped */
	
	audio_bgm_setloop(GreenHill,		 14.45, 52.845);
	audio_bgm_setloop(SuperTheme,		 0,     54.38);
	audio_bgm_setloop(Boss,			     3.25,  28.84);
	audio_bgm_setloop(SpecialStageTheme, 11.66, 50.2);
	audio_bgm_setloop(BonusStageTheme,   3.67,  32.65);
	audio_bgm_setloop(Invincibility,     10.1,  21.09);
}