/// @description Main
// You can write your code in this editor
	
	if object_check_overlap(TypeTrigger)
	{
		if Player.Rings == InitialAmount + 30
		{
			audio_sfx_play(sfxDucc, false);
			instance_destroy();
		}
	}
	else
	{
		InitialAmount = Player.Rings;
	}