function ObjBubbleStartup()
{
	// Initialise variables
	PosX		 =  x;
	PosY		 =  y;
	Ysp			 = -0.53125;
	BubbleType   =  0;
	WobbleOffset =  0;
	Collected	 =  0;
	FinalX		 =  0;
	Direction    =  0;
	
	// Set object properties
	object_set_unload(TypeDelete);
	object_set_depth(Player, 1);
}