function InterfaceResultsDraw()
{
	/* Value Table Reference
	----------------------------
	Value[0]  -  Timer
	Value[1]  -  State
	Value[2]  - 'CHARACTER HAS' X OFFSET
	Value[3]  - 'PASSED' X OFFSET
	Value[4]  -  OVAL X OFFSET
	Value[5]  - 'SCORE' X OFFSET
	Value[6]  - 'TIME BONUS' X OFFSET
	Value[7]  - 'RINGS BONUS' X OFFSET
	Value[8]  - 'ACT' X
	Value[9]  -  Ring Bonus
	Value[10] -  Time Bonus
	----------------------------
	*/
	
	if Stage.IsFinished < 2
	{
		return;
	}
	
	if !fade_check(StateActive)
	{	
		switch ResultsValue[1]
		{
			// Intialisation. Calculate bonuses
			case 0:
			{
				// Calculate ring bonus
				ResultsValue[9] = Player.Rings * 100;
			
				// Calculate time bonus
				if Stage.Time >= 35940
				{
					ResultsValue[10] = 100000;
				}
				else if Stage.Time < 1800
				{
					ResultsValue[10] = 50000;
				}			
				else if Stage.Time >= 1800 and Stage.Time < 2700
				{
					ResultsValue[10] = 10000;
				}
				else
				{
					switch Stage.Time div 1800
					{
						case 0:			
							ResultsValue[10] = 5000; 
						break;
						case 1:			
							ResultsValue[10] = 5000;  
						break;
						case 2:			
							ResultsValue[10] = 4000;  
						break;
						case 3:			
							ResultsValue[10] = 3000;  
						break;
						case 4: 
						case 5: 
							ResultsValue[10] = 2000;  
						break;
						case 6: 
						case 7: 
							ResultsValue[10] = 1000;  
						break;
						case 8: 
						case 9: 
							ResultsValue[10] = 500;   
						break;
						default:
							ResultsValue[10] = 0;	  
						break;
					}
				}			
				
				// Increment state
				ResultsValue[1]++;
			}
			break;
			
			// Wait
			case 1:
			{
				if (++ResultsValue[0]) > 46
				{
					ResultsValue[0]  = 0;
					ResultsValue[1] += 1;
				}
			}
			break;
			
			// Move assets
			case 2:
			{
				var Speed = 16 * (Game.Width / 320);
				
				ResultsValue[2] = min(ResultsValue[2] + Speed, 0);
				ResultsValue[4] = max(ResultsValue[4] - Speed, 0);
				
				if ResultsValue[2] == 0 and ResultsValue[3] != 0
				{
					if (++ResultsValue[0]) > 6
					{
						ResultsValue[3] = min(ResultsValue[3] + Speed, 0);
					}
					if ResultsValue[3] == 0
					{
						ResultsValue[0] = 0;
					}
				}
				if ResultsValue[3] == 0 and ResultsValue[8] != 0
				{
					ResultsValue[8] = max(ResultsValue[8] - Speed, 0);
				}
				if ResultsValue[8] == 0
				{
					if ResultsValue[0] > 5
					{
						ResultsValue[5] = max(ResultsValue[5] - Speed, 0);
					}
					if ResultsValue[0] > 7
					{
						ResultsValue[6] = max(ResultsValue[6] - Speed, 0);
					}
					if ResultsValue[0] > 9
					{
						ResultsValue[7] = max(ResultsValue[7] - Speed, 0);
					}
					ResultsValue[0]++;
				}
				
				// Increment state
				if ResultsValue[7] == 0
				{
					ResultsValue[0]  = 0;
					ResultsValue[1] += 1;	
				}
			}
			break;
			
			// Count
			case 3:
			{
				if (ResultsValue[0]++) == 180
				{
					audio_sfx_play(sfxScoreCount, true);
				}
				
				if ResultsValue[0] >= 180
				{
					if ResultsValue[10]
					{ 
						ResultsValue[10] -= 100;
						Player.Score     += 100;
					}
					if ResultsValue[9]
					{
						ResultsValue[9] -= 100;
						Player.Score    += 100;
					}
					
					if ResultsValue[10] == 0 and ResultsValue[9] == 0
					{
						audio_sfx_play(sfxScoreTally, false);
						audio_sfx_stop(sfxScoreCount);
						
						// Increment state
						ResultsValue[0]  = 0;
						ResultsValue[1] += 1;
					}
				}
			}
			break;
			
			// Fade out / move out
			case 4:
			{
				if !Game.StageTransitions or Stage.ActID == Stage.FinalActID
				{
					if (ResultsValue[0]++) == 180
					{
						fade_perform(ModeInto, BlendBlack, 1);
						
						Camera.Enabled        = false;
						Stage.UpdateObjects   = false;
						Game.UpdateAnimations = false;
					}
				}
				else if (ResultsValue[0]++) >= 180
				{
					var Speed = 16 * (Game.Width / 320);
					
					if ResultsValue[6] > 240 * (Game.Width / 320) * 1.5
					{
						ResultsValue[1]	+= 1;
						Stage.IsFinished = 3;
					}
					ResultsValue[2] -= Speed * 2;
					ResultsValue[3] -= Speed * 2;
					ResultsValue[4] += Speed * 2;
					ResultsValue[5] += Speed * 2;
					ResultsValue[6] += Speed * 2;
					ResultsValue[7] += Speed * 2;
					ResultsValue[8] += Speed * 2;			
				}
			}
			break;
		}
	}
	
	// Draw assets
	var CentreX = Game.Width  / 2;
	var CentreY = Game.Height / 2;
		
	draw_sprite(gui_results_oval, Game.Character, CentreX + 44 + ResultsValue[4], CentreY - 36);
	draw_sprite(gui_results_act,  Stage.ActID,    CentreX + 45 + ResultsValue[8], CentreY - 26);
		
	draw_sprite(gui_results_character, Game.Character, CentreX + 89 + ResultsValue[2], CentreY - 60);
	draw_sprite(gui_results_passed,    0,			   CentreX + 47 + ResultsValue[3], CentreY - 40);
		
	draw_sprite(gui_results_score,	   0, CentreX - 79 + ResultsValue[5], CentreY - 13);
	draw_sprite(gui_results_timebonus, 0, CentreX - 79 + ResultsValue[6], CentreY + 3);
	draw_sprite(gui_results_ringbonus, 0, CentreX - 79 + ResultsValue[7], CentreY + 19);
		
	draw_set_font(game_font(font_counter));
	draw_set_halign(fa_right);
	
	draw_text(CentreX + 84 + ResultsValue[5], CentreY - 6,  Player.Score);
	draw_text(CentreX + 84 + ResultsValue[6], CentreY + 10, ResultsValue[10]);
	draw_text(CentreX + 84 + ResultsValue[7], CentreY + 26, ResultsValue[9]);
}