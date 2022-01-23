/// @function audio_bgm_play_intro(soundid)
function audio_bgm_play_intro(soundid)
{
	// Play track
	if !audio_is_playing(soundid)
	{
		audio_sound_gain(soundid, Game.MusicVolume, 0);
		
		Audio.PrimaryTrack[0] = EventIdle;
		Audio.PrimaryTrack[1] = audio_play_sound(soundid, 0, false);
			
		// Set loopdata
		if ds_map_exists(Audio.TrackLoop, soundid)
		{
			Audio.PrimaryTrack[3] = Audio.TrackLoop[? soundid];
		}
		else
		{
			Audio.PrimaryTrack[3] = [];
		}
			
		// Play DAC
		if Audio.PrimaryTrack[4]
		{
			audio_stop_sound(Audio.PrimaryTrack[4]);
		}
		if ds_map_exists(Audio.DACChannel, soundid)
		{
			Audio.PrimaryTrack[4] = audio_play_sound(Audio.DACChannel[? soundid], 0, false);
				
			audio_sound_gain(Audio.DACChannel[? soundid], Game.MusicVolume, 0);
		}
		else
		{
			Audio.PrimaryTrack[4] = noone;
		}
		
		Game.IntroTrack[0] = Audio.PrimaryTrack[1];
		Game.IntroTrack[1] = Audio.PrimaryTrack[4];
	}
	
	// Get data
	else
	{
		Audio.PrimaryTrack[0] = EventIdle;
		Audio.PrimaryTrack[1] = Game.IntroTrack[0];
		Audio.PrimaryTrack[4] = Game.IntroTrack[1];
		
		Game.IntroTrack[0] = 0;
		Game.IntroTrack[1] = 0;
	}
}