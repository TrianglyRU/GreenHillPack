function ObjBackgroundTriggerMain()
{
	// Check for overlap
	if object_check_overlap(TypeTrigger)
	{
		if !State
		{
			// Switch to a new background
			switch room
			{
				#region GHZ2
				case Stage_GHZ2:
				{
					if !BGType
					{
						background_layer_setup(0, 0, -32, 0.375, -0.032, -1,    0, 0, 0,     0);
						background_layer_setup(1, 0, 0,   0.375, -0.032, -0.5,  0, 0, 0,     0);
						background_layer_setup(2, 0, 16,  0.375, -0.032, -0.25, 0, 0, 0,     0);
						background_layer_setup(3, 0, 32,  0.375, -0.032, 0,     0, 0, 0,     0);
						background_layer_setup(4, 0, 80,  0.5,   -0.032, 0,     0, 0, 0,     0);
						background_layer_setup(5, 0, 120, 0.5,   -0.032, 0,     0, 1, 0.005, 0);
					}
			
					// Switch to previous background
					else
					{
						background_layer_setup(0, 0, -32 + 24, 0.375, -0.032, -1,    0, 0, 0,     0);
						background_layer_setup(1, 0, 0   + 24, 0.375, -0.032, -0.5,  0, 0, 0,     0);
						background_layer_setup(2, 0, 16  + 24, 0.375, -0.032, -0.25, 0, 0, 0,     0);
						background_layer_setup(3, 0, 32  + 24, 0.375, -0.032, 0,     0, 0, 0,     0);
						background_layer_setup(4, 0, 80  + 24, 0.5,   -0.032, 0,     0, 0, 0,     0);
						background_layer_setup(5, 0, 120 + 24, 0.5,   -0.032, 0,     0, 1, 0.005, 0);
					}
				}
				break;
				#endregion
			}

			// Update flags
			BGType = !BGType;
			State += 1;
		}
	}
	else if State
	{
		State--;
	}
}