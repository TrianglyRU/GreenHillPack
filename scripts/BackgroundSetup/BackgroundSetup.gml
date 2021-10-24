function BackgroundSetup()
{
	switch room
	{	
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
			
			// Setup layers
			background_layer_setup(0, 0, -32, 0.375, -0.032, -1,    0, 0,   0);
			background_layer_setup(1, 0, 0,   0.375, -0.032, -0.5,  0, 0,   0);
			background_layer_setup(2, 0, 16,  0.375, -0.032, -0.25, 0, 0,   0);
			background_layer_setup(3, 0, 32,  0.375, -0.032, 0,     0, 0,   0);
			background_layer_setup(4, 0, 80,  0.5,   -0.032, 0,     0, 0,   0);
			background_layer_setup(5, 0, 120, 0.5,   -0.032, 0,     1, 0.1, 0);
			
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