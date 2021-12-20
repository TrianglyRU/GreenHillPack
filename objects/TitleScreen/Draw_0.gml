/// @description Insert description here
// You can write your code in this editor
	
	// Draw back part of the logo
	draw_sprite(tex_title_logo1, 0, Camera.ViewX + Game.Width / 2, Game.Height / 2 - 37);
	
	// Set position for Sonic
	var SonicX = Camera.ViewX + Game.Width / 2 + 4;
	var SonicY = Game.Height / 2 - 42;
	
	// Get Sonic size
	var SonicW = sprite_get_width(tex_title_sonic0);
	var SonicH = sprite_get_height(tex_title_sonic0);
	
	// Draw text
	switch SubState
	{
		case 1:
		{
			draw_animated_sprite(tex_title_startbutton, 32, StateTimer - 10, Camera.ViewX + Game.Width / 2, Camera.ViewY + Game.Height - 44);
		}
		break;
		case 2:
		{
			if !StateOption
			{
				draw_animated_sprite(tex_title_startgame, 24, SubStateTimer, Camera.ViewX + Game.Width / 2, Camera.ViewY + Game.Height - 44);
				draw_sprite(tex_title_quit, 0, Camera.ViewX + Game.Width / 2, Camera.ViewY + Game.Height - 26);
			}
			else
			{
				draw_sprite(tex_title_startgame, 0, Camera.ViewX + Game.Width / 2, Camera.ViewY + Game.Height - 44);
				draw_animated_sprite(tex_title_quit, 24, SubStateTimer, Camera.ViewX + Game.Width / 2, Camera.ViewY + Game.Height - 26);
			}
		}
		break;
	}
	
	// Draw Sonic
	switch State
	{
		// Appear
		case 0:
		{
			if StateTimer > 27 and !fade_check(StateActive)
			{
				SonicShift = max(0, SonicShift - 8);	
			}
			draw_sprite_part(tex_title_sonic0, 0, 0, 0, SonicW, SonicH - SonicShift, SonicX - SonicW / 2, SonicY + SonicShift - SonicH / 2);
		}
		break;
		case 1:
		{
			// First frame (it is drawn for 4 frames)
			if StateTimer < 4
			{
				draw_sprite(tex_title_sonic0, 0, SonicX, SonicY);
			}
			
			// Pre-loop (8 frames each frame)
			else if StateTimer < 44
			{
				draw_animated_sprite(tex_title_sonic1, 8, StateTimer - 4, SonicX, SonicY);
			}
			
			// Loop (8 frames each frame)
			else
			{
				draw_animated_sprite(tex_title_sonic2, 8, StateTimer - 4, SonicX, SonicY);
			}
		}
		break;
		
		// Static frame
		case 2:
		{
			draw_sprite(tex_title_sonic2, 0, SonicX, SonicY);
		}
		break;
	}
	
	// Draw front part of the logo
	draw_sprite(tex_title_logo2, 0, Camera.ViewX + Game.Width / 2, Game.Height / 2 + 29);
	
	// Draw copyright
	draw_sprite(tex_title_copyright, 0, Camera.ViewX + Game.Width - 96, Game.Height - 24);