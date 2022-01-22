function GameAnimationsProcess()
{
	if !Game.UpdateAnimations and !Game.DemoMode
	{
		exit;
	}
	
	// Process global animation timer
	Game.AnimationTime[? GlobalTime]++;
	
	with all 
	{
		// Handle subimage change
		var FrameDuration  = is_array(image_duration) ? image_duration[image_index] : image_duration;
		if  FrameDuration != 0
		{
			if !(--image_timer)
			{
				// Switch to the previous subimage
				if FrameDuration < 0
				{
					if image_index > 0
					{
						image_index--;
					}
					else
					{
						image_index = image_number - image_loopframe - 1;
					}
				}
					
				// Switch to the next subimage
				else
				{
					if image_index < image_number - 1
					{
						image_index++;
					}
					else
					{
						image_index = image_loopframe;
					}
				}
					
				// Reset timer
				if !is_array(image_duration)
				{
					image_timer = abs(image_duration);
				}
				else
				{
					image_timer = abs(image_duration[image_index]);
				}
			}
		}		
	}
}