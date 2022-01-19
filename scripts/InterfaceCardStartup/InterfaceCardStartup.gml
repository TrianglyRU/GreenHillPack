function InterfaceCardStartup()
{
	/* Value Table Reference
	------------------------
	Value[0] - Timer
	Value[1] - State
	Value[2] - Oval X
	Value[3] - Zone Name X
	Value[4] - Zone X
	Value[5] - Act Number X
	------------------------
	*/
	
	// Initialise variables
	CardValue[0] =  0;
	CardValue[1] =  0;	
	CardValue[2] =  Game.Width + 28;
	CardValue[3] =  8;
	CardValue[4] =  8;
	CardValue[5] =  Game.Width + 22;
	
	// Disable all input
	Input.IgnoreInput = true;
	
	// Turn screen into black
	if array_equals(Game.TransitionData, [])
	{
		fade_perform(ModeInto, BlendBlack, 0); Game.UpdateAnimations = false;
	}
}