/// @description Post-Objects Code
// You can write your code in this editor
	
	// Post-Objects Scripts
	StageGameplayProcess();
	StageObjectsProcess();
	StageBoundariesProcess();
	StageEndProcess();
	
	if instance_exists(Chopper)
	{
		show_debug_message("Chopper: " + string(Chopper.depth));
	}
	if instance_exists(Bridge)
	{
		show_debug_message("Bridge: " + string(Bridge.depth));
	}