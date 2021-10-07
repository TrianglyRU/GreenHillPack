function BackgroundSetup()
{
	switch room
	{	
		// Test Stage
		case Stage_TZ:
		{
			// Add layers
			background_layer_add(0, tex_tsz_bg00);
			background_layer_add(1, tex_tsz_bg01);
			background_layer_add(2, tex_tsz_bg02);
			background_layer_add(3, tex_tsz_bg03);
			background_layer_add(4, tex_tsz_bg04);
			background_layer_add(5, tex_tsz_bg05);
			background_layer_add(6, tex_tsz_bg06);
			
			// Setup layers
			background_layer_setup(0, 0, 0,   0.45, 0.05, -0.5, 0, 0,   0);
			background_layer_setup(1, 0, 20,  0.35, 0.05, -0.3, 0, 0,   0);
			background_layer_setup(2, 0, 41,  0.25, 0.05, -0.1, 0, 0,   0);
			background_layer_setup(3, 0, 59,  0.15, 0.05, 0,    0, 0,   0);
			background_layer_setup(4, 0, 116, 0.19, 0.05, 0,    0, 0,   0);
			background_layer_setup(5, 0, 164, 0.19, 0.05, 0,    1, 0.3, 0);
			background_layer_setup(6, 0, 189, 0.6,  0.05, 0,    0, 0,   0);
			
			// Set colour
			background_colour_set($004400);
		}
		break;
		
		// GHZ
		case Stage_GHZ1:
		{
			// Add layers
			background_layer_add(0, tex_ghz_bg00);
			background_layer_add(1, tex_ghz_bg01);
			background_layer_add(2, tex_ghz_bg02);
			background_layer_add(3, tex_ghz_bg03);
			background_layer_add(4, tex_ghz_bg04);
			background_layer_add(5, tex_ghz_bg05);
			
			// Get background offset if playing in 240p mode
			var Offset = (Game.Height == 240) * 8;
			
			// Setup layers
			background_layer_setup(0, 0, -32 + Offset, 0.375, -0.032, -1,    0, 0,   0);
			background_layer_setup(1, 0, 0   + Offset, 0.375, -0.032, -0.5,  0, 0,   0);
			background_layer_setup(2, 0, 16  + Offset, 0.375, -0.032, -0.25, 0, 0,   0);
			background_layer_setup(3, 0, 32  + Offset, 0.375, -0.032, 0,     0, 0,   0);
			background_layer_setup(4, 0, 80  + Offset, 0.5,   -0.032, 0,     0, 0,   0);
			background_layer_setup(5, 0, 120 + Offset, 0.5,   -0.032, 0,     1, 0.1, 0);
			
			// Set colour
			background_colour_set($FC9000);
		}
		break;
		
		// Default
		default: 
		{
			BGSprites = [];
			BGColour  = c_gray;
		}
		break;
	}	
}