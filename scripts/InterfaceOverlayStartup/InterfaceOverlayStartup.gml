function InterfaceOverlayStartup()
{	
	// Initialise variables
	Enabled = true;
	OffsetX = 0;
	OffsetY = 0;
	
	if Game.IntroSequence
	{
		Enabled = false;
	}
}