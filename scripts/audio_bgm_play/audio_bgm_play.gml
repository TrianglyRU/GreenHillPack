/// @function audio_bgm_play(channelType,soundid)
function audio_bgm_play(channelType,soundid)
{	
	// Exit if no audio set
	if !soundid
	{
		exit;
	}
	
	// Play new track
	switch channelType
	{
		case ChannelPrimary:
		{
			// Play track
			audio_stop_sound(Audio.PrimaryTrack[1]);
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
		}
		break;
		case ChannelSecondary:
		{
			// Play track
			audio_stop_sound(Audio.SecondaryTrack[1]);
			audio_sound_gain(soundid, Game.MusicVolume, 0);

			Audio.SecondaryTrack[0] = EventIdle;
			Audio.SecondaryTrack[1] = audio_play_sound(soundid, 0, false);	
			
			// Play DAC
			if Audio.SecondaryTrack[3]
			{
				audio_stop_sound(Audio.SecondaryTrack[3]);
			}
			if ds_map_exists(Audio.DACChannel, soundid)
			{
				Audio.SecondaryTrack[3] = audio_play_sound(Audio.DACChannel[? soundid], 0, false);
				
				audio_sound_gain(Audio.DACChannel[? soundid], Game.MusicVolume, 0);
			}
			else
			{
				Audio.SecondaryTrack[3] = noone;
			}
		}
		break;
	}	
}