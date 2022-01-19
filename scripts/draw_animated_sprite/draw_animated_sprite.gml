/// @function draw_animated_sprite(spriteid,duration,useGlobalTime,x,y)
function draw_animated_sprite(spriteid,duration,useGlobalTime,x,y)
{
	// Set duration timer for that sprite
	if !useGlobalTime
	{
		if !ds_map_exists(Game.AnimationTime, spriteid)
		{
			ds_map_add(Game.AnimationTime, spriteid, 0);
		}
	
		// Count timer
		else if Game.UpdateAnimations
		{
			Game.AnimationTime[? spriteid]++;
		}
		var Timer = Game.AnimationTime[? spriteid];
	}
	else
	{
		var Timer = Game.AnimationTime[? GlobalTime];
	}
	
	// Draw sprite
	if !duration
	{
		show_debug_message("WARNING: Called draw_animated_sprite with duration equals to 0 or less. Use regular draw_sprite() function!");
	}
	else
	{
		draw_sprite(spriteid, Timer div duration mod sprite_get_number(spriteid), x, y);
	}
}