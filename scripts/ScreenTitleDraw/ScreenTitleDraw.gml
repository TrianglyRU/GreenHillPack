function ScreenTitleDraw()
{
	// Draw back part of the logo
	draw_sprite(tex_title_logo1, State == TitleState.Settings, Camera.ViewX + Game.Width / 2, Game.Height / 2 - 37);
	
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
	

	if State != TitleState.Settings
	{
		// Draw Sonic
		if StateTimer > 29
		{
			if StateTimer < 39
			{
				if !fade_check(StateActive)
				{
					SonicShift = max(0, SonicShift - 8);
				}
				draw_sprite_part(tex_title_sonic0, 0, 0, 0, SonicW, SonicH - SonicShift, SonicX - SonicW / 2, SonicY + SonicShift - SonicH / 2);
			}
			else if StateTimer < 87
			{
				draw_animated_sprite(tex_title_sonic1, 8, false, SonicX, SonicY);
			}
			else if StateTimer < 376
			{
				draw_animated_sprite(tex_title_sonic2, 8, false, SonicX, SonicY);
			}
			else
			{
				draw_sprite(tex_title_sonic2, 0, SonicX, SonicY);
			}
		}
	}
	
	// Draw static Sonic (if we're in the settings menu)
	else if StateTimer > 29
	{
		if StateTimer < 39
		{
			draw_sprite_part(tex_title_sonic0, 1, 0, 0, SonicW, SonicH - SonicShift, SonicX - SonicW / 2, SonicY + SonicShift - SonicH / 2);
		}
		else if StateTimer < 87
		{
			draw_sprite(tex_title_sonic1_brown, Game.SpriteTimers[? tex_title_sonic1] div 8 mod sprite_get_number(tex_title_sonic1), SonicX, SonicY);
		}
		else if StateTimer < 376
		{
			draw_sprite(tex_title_sonic2_brown, Game.SpriteTimers[? tex_title_sonic2] div 8 mod sprite_get_number(tex_title_sonic2), SonicX, SonicY);
		}
		else
		{
			draw_sprite(tex_title_sonic2_brown, 0, SonicX, SonicY);
		}
	}

	// Draw front part of the logo and copyright
	draw_sprite(tex_title_logo2,     State == TitleState.Settings, Camera.ViewX + Game.Width / 2,  Game.Height / 2 + 29);
	draw_sprite(tex_title_copyright, State == TitleState.Settings, Camera.ViewX + Game.Width - 96, Game.Height - 28);
	
	// Draw options
	if State == TitleState.Settings
	{
		draw_set_font(game_font(font_title)); 
		
		// Get options data
		var OptionsData =
		[
			"",
			"",
			get_option("character"),
			get_boolean(Game.SpindashEnabled),
			get_boolean(Game.PeeloutEnabled),
			get_boolean(Game.DSpinAttackEnabled),
			get_boolean(Game.RolljumpControl),
			get_boolean(Game.FlightCancel),
			get_option("speedcap"),
			get_boolean(Game.StageTransitions),
			get_boolean(Game.SmoothRotation),
			get_option("camera"),
			get_option("timer"),
			"",
			"",
			get_boolean(Game.WindowFullscreen),
			string(Game.WindowSize) + "X",
			"",
			"",
			"",
			string(Game.MusicVolume * 100) + "%",
			string(Game.SoundVolume * 100) + "%"
		];
		
		// Define a range of options to display
		var Length = SettingOption <= 12 ? [0, 12] : [13, array_length(StringData) - 1];
		
		for (var i = Length[0]; i <= Length[1]; i++)
		{
			if i == SettingOption
			{
				draw_set_colour($00FCFC); 
			}
			else
			{
				draw_set_colour($FCFCD9);
			}
			if i == 0 or i == 13 or i == 18
			{
				draw_set_halign(fa_center);
				draw_text(Camera.ViewX + Game.Width / 2,  24 + (i < 13 ? i * 12 : (i - 13) * 12), StringData[i]);
			}
			else
			{
				draw_set_halign(fa_left);  
				draw_text(Camera.ViewX + 90,			  24 + (i < 13 ? i * 12 : (i - 13) * 12), StringData[i]);
			
				draw_set_halign(fa_right); 
				draw_text(Camera.ViewX + Game.Width - 81, 24 + (i < 13 ? i * 12 : (i - 13) * 12), OptionsData[i]);
			}
			draw_set_colour($FFFFFF);
		}
	}
}