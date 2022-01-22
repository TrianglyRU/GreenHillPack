function InterfaceCardDraw()
{
	/* Value Table Reference
	------------------------
	Value[0] - Timer
	Value[1] - State
	Value[2] - Oval X
	Value[3] - Zone Name X
	Value[4] - Zone X
	Value[5] - Act Number X
	------------------------
	*/
	
	var AssetSpeed = 16 * (Game.Width / 320);
	
	if CardValue[1] == 3
	{
		exit;
	}
	switch CardValue[1]
	{
		// Appear
		case 0:
		{	
			if CardValue[0] == 0
			{
				if !fade_check(StateActive)
				{
					Stage.UpdateObjects = true;
				}
			}
			CardValue[0]++;
			
			if CardValue[3] != Game.Width / 2 + 92
			{
				if CardValue[0] > 10
				{
					CardValue[2] = max(CardValue[2] - AssetSpeed, Game.Width / 2 + 52);
					CardValue[3] = min(CardValue[3] + AssetSpeed, Game.Width / 2 + 92);
				}
				if CardValue[3] == Game.Width / 2 + 92
				{
					CardValue[0] = 0;
				}
			}
			else if CardValue[4] != Game.Width / 2 + 68
			{
				if CardValue[0] > 4
				{
					CardValue[4] = min(CardValue[4] + AssetSpeed, Game.Width / 2 + 68);
				}
			}
			else if CardValue[5] != Game.Width / 2 + 53
			{
				CardValue[5] = max(CardValue[5] - AssetSpeed, Game.Width / 2 + 53);
			}
			else
			{
				CardValue[0]  = 0;
				CardValue[1] += 1;
			}
		}
		break;
		
		// Wait
		case 1:
		{
			if (++CardValue[0]) == 135
			{
				if fade_check(StateMax)
				{
					fade_perform(ModeFrom, BlendBlack, 1);
				}
			}
			else if CardValue[0] > 135
			{
				if !fade_check(StateActive)
				{
					Game.UpdateAnimations = true;
					Stage.UpdateObjects   = true;
					Stage.TimeEnabled     = true;
					Camera.Enabled        = true;
					Input.IgnoreInput     = false;
				
					CardValue[0]  = 0;
					CardValue[1] += 1;
				}
			}
		}
		break;
		
		// Disappear
		case 2:
		{
			if (++CardValue[0]) > 58
			{
				CardValue[3] -= AssetSpeed * 2;
				CardValue[4] -= AssetSpeed * 2;
				CardValue[2] += AssetSpeed * 2;
				CardValue[5] += AssetSpeed * 2;
			}
			if CardValue[0] > 64 + (Game.Width / 2 + 92) / AssetSpeed * 2
			{
				CardValue[0]  = 0;
				CardValue[1] += 1;
			}
		}
		break;
	}
		
	// Draw assets
	draw_sprite(gui_results_oval, Game.Character, CardValue[2], Game.Height / 2 - 16);
	draw_sprite(gui_results_act,  Stage.ActID,    CardValue[5], Game.Height / 2 - 6);

	draw_set_halign(fa_right); 
	draw_set_font(game_font(font_card_s1));
	
	draw_text(CardValue[3], Game.Height / 2 - 32, Stage.ZoneName);
	draw_text(CardValue[4], Game.Height / 2 - 12, "ZONE");
}