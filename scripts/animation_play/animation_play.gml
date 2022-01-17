/// @function animation_play(spriteid,duration,loopframe)
function animation_play(spriteid,duration,loopframe)
{
	// Update or set animation
	if sprite_index != spriteid or event_type == ev_create
	{
		if !is_array(duration)
		{
			image_timer = abs(duration);
		}
		else
		{
			image_timer = abs(duration[0]);	
		}
		image_loopframe = loopframe;
		image_duration  = duration;
		sprite_index    = spriteid;	
		image_index		= 0;
		image_speed     = 0;
	}
	
	// Update duration
	else 
	{	
		if !is_array(duration) and image_duration != duration
		or  is_array(duration) and !is_array(image_duration)
		{
			if !is_array(duration)
			{
				if image_timer == 0
				{
					image_timer = abs(duration);
				}
				image_duration = duration;
			}
			else
			{
				image_timer    = abs(duration[0]);
				image_duration = duration;
			}
		}
	}
}