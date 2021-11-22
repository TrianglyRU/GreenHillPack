function ObjSoundSourceMain()
{
	// Exit if fade is active
	if fade_check(FadeActive)
	{
		exit;
	}
	
	// Exit if this source is not the closest one
	if id != instance_nearest(floor(Player.PosX), floor(Player.PosY), SoundSource)
	{
		exit;
	}
	
	// Play sound sound
	if !audio_is_playing(SustainSound)
	{
		audio_play_sound(SustainSound, 0, true);
		audio_sound_gain(SustainSound, 0, 0);
	}
	
	// Restore gain
	if abs(Camera.ViewX + Game.Width / 2 - x) < Game.Width / 2 + 128
	{
		audio_sound_gain(SustainSound, Game.SoundVolume, 0);
	}
	
	// Mute
	else
	{
		audio_sound_gain(SustainSound, 0, 250);
	}
}