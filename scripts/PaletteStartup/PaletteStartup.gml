function PaletteStartup()
{	
	// Initialise variables
	ColourSet   = [];
	Duration    = [];
	SwapTime    = [];
	Sequence    = [];
	
	SurfaceMain    = noone;
	SurfaceOverlay = noone;
	SurfaceReset   = false;
	
	FadeStep    = 756;
	FadeMode    = 1;
	FadeBlend   = 0;
	FadeSpeed   = 0;
	
	// Initialise palette animation storage
	for (var i = 0; i < PaletteLimit; i++)
	{
		for (var j = 0; j < PaletteLimit; j++)
		{
			Duration[i, j] = noone;
			Sequence[i, j] = noone;
			SwapTime[i, j] = noone;
		}	
		IndexType1[i] = 1;
		IndexType2[i] = 1;
	}
}