/// @function object_set_depth(target,above)
function object_set_depth(target,renderdepth)
{
	// Apply depth relative to the player
	if target == Player
	{
		switch object_index
		{
			case SolidWall:
			case FloatingPlatform:
				var Tolerance = 60;
			break;
			default:
				var Tolerance = 50;
			break;
		}		
		depth = Player.DrawOrder - (renderdepth ? Tolerance : -Tolerance);
	}
	
	// Apply depth relative to another object
	else
	{
		depth = target.depth - (renderdepth ? 1 : -1);
	}
}