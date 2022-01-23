function audio_bgm_setDAC(maintrack, drums)
{
	if object_index != Audio
    {
        show_debug_message("WARNING: audio_bgm_setDAC function has been called outside of Audio controller! Skipping...");
    }
	else
	{
		ds_map_add(DACChannel, maintrack, drums);
	}
}