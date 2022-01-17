/// @description Main
// You can write your code in this editor
	
	if !Stage.Time or id != instance_nearest(Player.PosX, Player.PosY, SoundSource)
	{
		exit;
	}
	
	// Play sound
	if !audio_is_playing(SustainSound)
	{
		audio_play_sound(SustainSound, 0, true); audio_sound_gain(SustainSound, 0, 0);
	}
	
	// Set gain
	if abs(Camera.ViewX + Game.Width / 2 - x) < Game.Width / 2 + 128
	{
		audio_sound_gain(SustainSound, Game.SoundVolume, 0);
	}
	else
	{
		audio_sound_gain(SustainSound, 0, 250);
	}