function ObjBarrierSparkleStartup()
{
	// Initialise variables
	Timer	  = 0;
	State     = 0;
	SparkleID = 0;
	
	// Set object properties
	object_set_depth(Barrier, 1);
	animation_play(sprite_index, 1, 0);
}