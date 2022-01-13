/// @description Main
// You can write your code in this editor
	
	switch State
	{
		// Inactive
		case 0:
		{
			// Exit if no overlap occured
			if !object_check_overlap(TypeTrigger)
			{
				break;
			}
			
			// Play sound
			audio_sfx_play(sfxHiddenPoints, false);
			
			// Make object visible
			visible = true;	
			
			// Give points
			switch Type
			{
				case 100: 
				{
					image_index = 1;
				}
				break;
				case 1000:  
				{
					image_index = 2;
				}
				break;
				case 10000: 
				{
					image_index = 3;
				}
				break;
			}
			Player.Score += Type;
			State	     += 1;
		}
		break;
		
		// Triggered
		case 1:
		{
			if !(--StateTimer)
			{
				instance_destroy();
			}
		}
		break;
	}