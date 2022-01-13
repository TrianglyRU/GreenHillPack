/// @description Main
// You can write your code in this editor
	
	// Exit if fade is active
	if fade_check(StateActive)
	{
		exit;
	}
	
	// Exit if this source is not the closest one
	if id != instance_nearest(floor(Player.PosX), floor(Player.PosY), SoundSource)
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