/// @description Insert description here
// You can write your code in this editor
	
	// Update palette
	palette_handle(PaletteDry, 0, 4, 4, 1, 6);
	
	// State machine
	switch State
	{
		case 0:
		{
			if !fade_check(FadeActive)
			{
				if (++StateTimer) == 42
				{
					State	  += 1;
					StateTimer = 0;
				}
			}
		}
		break;
		case 1:
		{
			if (++StateTimer) == 334
			{
				State	  += 1;
				StateTimer = 0;
			}
		}
		break;
	}
	
	// Move camera (scroll the background)
	if State
	{
		Camera.PosX += 2;
	}