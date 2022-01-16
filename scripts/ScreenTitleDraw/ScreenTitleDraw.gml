function ScreenTitleDraw()
{
	// Draw back part of the logo
	draw_sprite(tex_title_logo1, 0, Camera.ViewX + Game.Width / 2, Game.Height / 2 - 37);
	
	// Get Sonic size
	var SonicW = sprite_get_width(tex_title_sonic0);
	var SonicH = sprite_get_height(tex_title_sonic0);
	
	// Set Sonic's position
	var SonicX = Camera.ViewX + Game.Width / 2 + 4;
	var SonicY = Game.Height / 2 - 42;
	
	// Set text position
	var TextX = Camera.ViewX + Game.Width / 2;
	var TextY = Camera.ViewY + Game.Height - 44;
	
	// Draw text
	switch State
	{
		case TitleState.preRoll:
		{
			draw_animated_sprite(tex_title_startbutton, 32, false, TextX, TextY);
		}
		break;
		case TitleState.Settings:
		{
		}
		break;
		case TitleState.Main:
		{
			draw_sprite(tex_title_options, StateOption, TextX, TextY);
				
			draw_animated_sprite(tex_title_options_arrow,     8, true, TextX - (48 - StateOption * 12), TextY);
			draw_animated_sprite_ext(tex_title_options_arrow, 8, true, TextX + (48 - StateOption * 12), TextY, -1, 1);
		}
		break;
		default:
		{
			
		}
		break;
	}
	
	// Draw Sonic
	if Game.GlobalTime > 29
	{
		if Game.GlobalTime < 39
		{
			if !fade_check(StateActive)
			{
				SonicShift = max(0, SonicShift - 8);
			}
			draw_sprite_part(tex_title_sonic0, 0, 0, 0, SonicW, SonicH - SonicShift, SonicX - SonicW / 2, SonicY + SonicShift - SonicH / 2);
		}
		
		// Pre-loop
		else if Game.GlobalTime < 87
		{
			draw_animated_sprite(tex_title_sonic1, 8, false, SonicX, SonicY);
		}
		
		// Loop
		else if Game.GlobalTime < 376
		{
			draw_animated_sprite(tex_title_sonic2, 8, false, SonicX, SonicY);
		}
		
		// Static frame
		else
		{
			draw_sprite(tex_title_sonic2, 0, SonicX, SonicY);
		}
	}
	
	// Draw front part of the logo
	draw_sprite(tex_title_logo2, 0, Camera.ViewX + Game.Width / 2, Game.Height / 2 + 29);
	
	// Draw copyright
	draw_sprite(tex_title_copyright, 0, Camera.ViewX + Game.Width - 96, Game.Height - 24);
}