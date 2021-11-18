/// @description Insert description here
// You can write your code in this editor
	
	switch State
	{
		// Shift SEGA palette
		case 0:
		{	
			var Colour = palette_get_colour(PaletteDry, 0);
			if  Colour < 54
			{
				palette_handle(PaletteDry, 0, 47, 54, 54, 1);
			}
			else
			{
				State++;
			}
		}
		break;
		
		// Show up SEGA logo
		case 1:
		{
			if (++StateTimer) == 20
			{
				State	  += 1;
				StateTimer = 0;
				
				// Play sound
				audio_sfx_play(sfxSega, false);
			}
		}
		break;
		
		// Swap logos
		case 2:
		{
			if (++StateTimer) == 160
			{
				fade_perform(FadeTo, ColourBlack, 1);
			}
			else if fade_check(FadeMax)
			{
				// Increment state
				State	  += 1;
				StateTimer = 0;
				
				// Set background colour to black
				layer_background_blend(layer_background_get_id("Background"), c_black);
				
				// Fade from
				fade_perform(FadeFrom, ColourBlack, 1);
			}
		}
		break;
		
		// Go to the next room
		case 3:
		{
			if (++StateTimer) == 80
			{
				fade_perform(FadeTo, ColourBlack, 1);
			}
			else if fade_check(FadeMax)
			{
				room_goto(Screen_DevMenu);
				//room_goto(Stage_GHZ1);
			}
		}
		break;
	}