function BonusStageProcess()
{
	switch State
	{
		case 0:
		{
			if !fade_check(FadeActive)
			{
				// Give 10 rings
				if Input.APress
				{
					Game.BonusStageData[0] += 10;
					audio_sfx_play(choose(sfxRingLeft, sfxRingRight), false);
						
					// Grant extra life
					if Game.BonusStageData[0] >= RingState * 100
					{
						Game.Lives++;
						audio_bgm_play(PriorityHigh, ExtraLife, 0, 0);
						
						// Increase amount of required rings
						RingState++;
					}
				}
	
				// Give random barrier
				else if Input.BPress
				{
					var    RandomNumber = choose(BarrierFlame, BarrierThunder, BarrierWater, BarrierNormal);
					switch RandomNumber
					{
						case BarrierFlame:
							audio_sfx_play(sfxFlameBarrier, false);
						break;
						case BarrierThunder:
							audio_sfx_play(sfxThunderBarrier, false);
						break;
						case BarrierWater:
							audio_sfx_play(sfxWaterBarrier, false);
						break;
						case BarrierNormal:
							audio_sfx_play(sfxBarrier, false);
						break;	
					}
					Game.BonusStageData[1] = RandomNumber;
				}
	
				// Leave
				else if Input.StartPress
				{
					fade_perform(FadeTo, ColourBlack, 1);
					State++;
					
					// Stop music
					audio_bgm_stop(PriorityLow,  0.5);
					audio_bgm_stop(PriorityHigh, 0.5);
				}
			}
		}
		break;
		case 1:
		{
			// Return back to stage
			if fade_check(FadeMax)
			{
				room_goto(Game.StageRoom);
			}
		}
	}
	
}