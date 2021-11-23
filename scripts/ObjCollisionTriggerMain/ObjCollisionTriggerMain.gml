function ObjCollisionTriggerMain()
{
	// Check for GroundOnly flag
	if GroundOnly and !Player.Grounded
	{
		exit;
	}
	
	// Exit if no overlap occured
	if !object_check_overlap(Triggerbox) or Player.DebugMode
	{
		if State
		{
			if floor(Player.PosX) > x
			{
				Player.Layer = LayerA;
			}
			else
			{
				Player.Layer = LayerB;
			}
			State = 0;
		}
		exit;
	}
	
	// Check player's movement direction
	var    Direction = Player.Xsp > 0 ? RightDirection : LeftDirection;
	switch Direction
	{
		case "To LayerA":
		{
			TargetLayer = LayerA;
			image_index = 1;
		}
		break;
		case "To LayerB":
		{
			TargetLayer = LayerB;
			image_index = 2;
		}
		break;
	}
	
	// Change layer
	if !State
	{
		State++;
	}
	Player.Layer = TargetLayer;
}