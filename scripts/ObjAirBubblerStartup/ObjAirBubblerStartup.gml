function ObjAirBubblerStartup()
{
	/* Variable Definitions	
	1. GenerationSpeed, default = 1
	*/
	
	// Initalise variables
	Delay		 = irandom_range(128, 255);
	Cycle		 = 1;
	BubbleAmount = 0;
	BubbleID	 = 0;
	LargeID		 = 0;
	ChosenSet    = 0;
	State        = 0;
	
	// Initailise bubble sets
	BubbleSet[0] = [0,0,0,0,1,0];
	BubbleSet[1] = [0,0,0,1,0,0];
	BubbleSet[2] = [1,0,1,0,0,0];
	BubbleSet[3] = [0,1,0,0,1,0];
	
	// Set object properties
	object_set_unload(TypeReset);
	animation_play(sprite_index, 16, 0, 0);
}