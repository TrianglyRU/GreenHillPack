function AudioEnd()
{
	if Game.IntroSequence
	{
		audio_stop_sound(sfxJump);
		audio_stop_sound(sfxWaterfall);
		audio_stop_sound(sfxRingLeft);
		audio_stop_sound(sfxRingRight);
	}
	else
	{
		audio_stop_all();
	}
	ds_map_destroy(TrackLoop);
	ds_map_destroy(DACChannel);
}