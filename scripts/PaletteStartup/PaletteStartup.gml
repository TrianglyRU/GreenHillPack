function PaletteStartup()
{	
	// Set blank values
	ColourSet = [];
	Duration  = [];
	Sequence  = [];
	
	// Initialise palette animation storage
	for (var i = 0; i < PaletteLimit; i++)
	{
		for (var j = 0; j < PaletteLimit; j++)
		{
			Duration[i, j] = noone;
			Sequence[i, j] = noone;
		}	
		IndexDry[i] = 1;
		IndexWet[i] = 1;
	}
	
	// Setup fade
	FadeMode   = 1;
	FadeStep   = 756;
	FadeColour = 0;
	FadePower  = 0;
	
	// Disable surface draw
	application_surface_draw_enable(false);
}