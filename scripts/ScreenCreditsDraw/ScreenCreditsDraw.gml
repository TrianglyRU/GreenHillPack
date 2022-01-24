function ScreenCreditsDraw()
{
	var X = Game.Width  / 2;
	var Y = Game.Height / 2;
	
	// Draw logo
	draw_sprite(tex_title_logo1, 1, X, Y - 37);
	draw_sprite(tex_title_logo2, 1, X, Y + 29);
	
	draw_set_font(game_font(font_default));
	draw_set_halign(fa_center);
	
	draw_text(X, Y - 89, "* THANK YOU FOR PLAYING *");
	
	draw_set_colour($00FFFF);
	draw_text(X, Y - 79, "GREEN HILL REVISITED");
	
	draw_set_colour($FFFFFF);
	draw_text(X, Y - 46, "THIS PROJECT WAS MADE TO DEMONSTRATE")
	draw_text(X, Y - 36, "ORBINAUT FRAMEWORK")
	
	draw_text(X, Y - 16, "WE HOPE YOU ENJOYED PLAYING")
	draw_text(X, Y -  6, "IT AS WELL AS WE ENJOYED MAKING IT")
	
	draw_set_colour($00FFFF);
	draw_text(X, Y + 15, "* CREDITS *");
	draw_set_colour($FFFFFF);
	
	draw_set_halign(fa_left);
	draw_text(X - 128, Y + 36, "PROGRAMMERS:");
	draw_text(X - 128, Y + 46, "ARTWORK:");
	draw_text(X - 128, Y + 66, "MUSIC:");
	
	draw_set_halign(fa_right);
	draw_text(X + 128, Y + 36, "TRIANGLY MICG");
	draw_text(X + 128, Y + 46, "GINGOCAT ROSABELLE");
	draw_text(X + 128, Y + 56, "A+START");
	draw_text(X + 128, Y + 66, "JOHN TAY");

	draw_set_halign(fa_center);
	draw_text(X, Y + 89, "PRESS ANY KEY TO CONTINUE");
}