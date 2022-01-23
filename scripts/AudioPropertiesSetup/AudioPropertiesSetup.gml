function AudioPropertiesSetup()
{
	/* The game will refer to data stored here to loop the tracks. 
	If no data set here for the track, it won't be looped */
	
	audio_bgm_setloop(GreenHill_FM,		 14.80, 53.20);
	audio_bgm_setloop(Boss_FM,			 0.27,  21.60);
	audio_bgm_setloop(Invincibility_FM,	 1.13,  12.10);
	audio_bgm_setloop(SuperTheme,		 0,     54.38);
	audio_bgm_setloop(SpecialStageTheme, 11.66, 50.2);
	audio_bgm_setloop(BonusStageTheme,   3.67,  32.65);
	audio_bgm_setloop(HighSpeed_FM,		 1.4,   27.37);
	
	/* The game will refer to data stored here to add DRUMS. 
	If no data set here for the track, nothing will happen */
	
	audio_bgm_setDAC(GreenHill_FM,     GreenHill_DAC);
	audio_bgm_setDAC(Boss_FM,	       Boss_DAC);
	audio_bgm_setDAC(TitleTheme_FM,    TitleTheme_DAC);
	audio_bgm_setDAC(Invincibility_FM, Invincibility_DAC);
	audio_bgm_setDAC(HighSpeed_FM,	   HighSpeed_DAC);
}