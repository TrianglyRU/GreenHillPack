/// @description Insert description here
// You can write your code in this editor
	
	// Get screen centre
	var X = Game.Width  / 2;
	var Y = Game.Height / 2;
	
	// Draw palette-animated SEGA logo
	switch State
	{
		case 0:
			draw_sprite(tex_sega_logo_palette, 0, X, Y);
		break;
		case 1:
			draw_animated_sprite(tex_sega_logo_showup, 5, StateTimer, X, Y);
		break;
		case 2:
			draw_sprite(tex_sega_logo_showup, 4, X, Y);
		break;
		case 3:
			draw_sprite(tex_sega_sonicteam, 0, X, Y);
		break;
	}
	