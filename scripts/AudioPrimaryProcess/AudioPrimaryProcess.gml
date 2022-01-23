function AudioPrimaryProcess()
{
	if !PrimaryTrack[1] 
	{
		return;
	}
	
	/* Value Table Reference
	------------------------
	[0] - Event
	[1] - Track ID
	[2] - Event Time
	[3] - Loop Data
	[4] - DAC Channel
	------------------------
	*/
	
	// Get track data
	var Event     = PrimaryTrack[0];
	var Track     = PrimaryTrack[1];
	var EventTime = PrimaryTrack[2];
	var LoopData  = PrimaryTrack[3];
	var DAC       = PrimaryTrack[4];
	
	// Loop track
	var TrackPosition = audio_sound_get_track_position(Track);
	if  array_length(LoopData)
	{
		if TrackPosition >= LoopData[1]
		{
			if DAC
			{
				audio_sound_set_track_position(DAC, LoopData[0] + (TrackPosition - LoopData[1]));
			}
			audio_sound_set_track_position(Track, LoopData[0] + (TrackPosition - LoopData[1]));
		}
	}
	else if TrackPosition >= audio_sound_length(Track) - 0.1
	{
		if DAC
		{
			audio_stop_sound(DAC);
		}
		audio_bgm_stop(ChannelPrimary, 0);
	}
	
	switch Event
	{
		case EventIdle: break;
		case EventUnmute:
		{
			// Reset event
			if audio_sound_get_gain(Track) == 1
			{
				if DAC
				{
					audio_sound_gain(DAC, 1, 0);
				}
				PrimaryTrack[0] = EventIdle;
				PrimaryTrack[2] = 0;
			}
			
			// Increase track volume
			else
			{		
				var VolumeStep  = 1 / (EventTime * 60);
				var VolumeLevel = min(audio_sound_get_gain(Track) + VolumeStep, 1);
				
				audio_sound_gain(Track, VolumeLevel, 0);
			}
		}
		break;
		case EventMute:
		{	
			// Decrease track volume
			var VolumeStep  = 1 / (EventTime * 60);
			var VolumeLevel = max(audio_sound_get_gain(Track) - VolumeStep, 0);
			
			if DAC
			{
				audio_sound_gain(DAC, 0, 0);
			}
			audio_sound_gain(Track, VolumeLevel, 0);
		}
		break;
		case EventStop:
		{	
			// Stop and reset track
			if audio_sound_get_gain(Track) == 0
			{		
				PrimaryTrack[0] = EventIdle;
				PrimaryTrack[1] = noone;
				PrimaryTrack[2] = 0;
				PrimaryTrack[3]	= [];
				PrimaryTrack[4] = noone;
				
				audio_stop_sound(Track);
				audio_sound_gain(Track, Game.MusicVolume, 0);
			}
			else
			{
				// Decrease track volume
				var VolumeStep  = 1 / (EventTime * 60);
				var VolumeLevel = max(audio_sound_get_gain(Track) - VolumeStep, 0);
				
				if DAC
				{
					audio_stop_sound(DAC);
					audio_sound_gain(DAC, Game.MusicVolume, 0);
				}
				audio_sound_gain(Track, VolumeLevel, 0);
			}
		}
	}
}