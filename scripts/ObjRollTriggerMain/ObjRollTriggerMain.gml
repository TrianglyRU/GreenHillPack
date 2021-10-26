function ObjRollTriggerMain()
{	
	// Check for overlap
	if object_check_overlap(Triggerbox)
	{
		// Set player flags
		if Player.Grounded
		{
			// Set object flag
			if !State and abs(Player.Inertia) < 4
			{
				Player.Inertia = 4 * Player.Facing;
			}
			Player.ForcedRoll = true;
		
			// Increment state
			State = 1;
		}
	}
	
	// Reset
	else if State
	{
		State			  = false;
		Player.ForcedRoll = false;
	}
}