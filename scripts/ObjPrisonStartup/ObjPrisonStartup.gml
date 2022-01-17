function ObjPrisonStartup()
{
	// Initialise variables
	ExplosionTimer = irandom(32);
	TargetAnimal   = noone;
	State	       = 0;
	StateTimer	   = 0;
	
	// Set object properties
	object_set_solidbox(32, 25, false);
	object_set_unload(TypePause);
	object_set_depth(Player, 0);
	
	// Create button object
	ChildObject	= instance_create(x, y - 38, PrisonButton);
	with ChildObject
	{
		object_set_depth(EggPrison, 0);
	}
}