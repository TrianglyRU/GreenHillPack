function instance_initialise()
{
	// Initialise system variables
	if !variable_instance_exists(id, "image_duration")
	{
		image_timer     = 0;
		image_duration  = 0;
		image_loopframe = 0;
		image_speed		= 0;
	}
	if !variable_instance_exists(id, "Obj_SolidX")
	{
		Obj_SolidX      = 0;
		Obj_SolidY      = 0;
		Obj_SolidMap    = false;
		Obj_SolidTouchU = false;
		Obj_SolidTouchD = false;
		Obj_SolidTouchL = false;
		Obj_SolidTouchR = false;
		Obj_SolidPush   = false;
	}
	if !variable_instance_exists(id, "Obj_HitX")
	{
		Obj_HitX = 0;
		Obj_HitY = 0;
	}
	if !variable_instance_exists(id, "Obj_TriggerLeft")
	{
		Obj_TriggerLeft   = 0;
		Obj_TriggerRight  = 0;
		Obj_TriggerTop    = 0;
		Obj_TriggerBottom = 0;
	}
	if !variable_instance_exists(id, "Obj_UnloadType")
	{
		Obj_UnloadType = -1;
		Obj_UnloadData = [];
	}
	if !variable_instance_exists(id, "Obj_ChildrenIDs")
	{
		Obj_ChildrenIDs = [];
	}
}