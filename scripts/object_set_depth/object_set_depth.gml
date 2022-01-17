/// @function object_set_depth(target,depthFlag)
function object_set_depth(target,depthFlag)
{
	// Apply depth relative to the player
	if target == Player
	{
		switch object_index
		{
			/* You can add your objects for more advanced depth 
			manipulation. Example: 
			
			case FloatingPlatform:
				var Tolerance = 25;
			break; */	
			
			/* 
			If object is drawn above the target, the higher value
			means it will be closer to the camera
			
			If object is drawn behind the targer, the higher value
			 means  it will be further away from the camera
			*/
			
			case FloatingPlatform:    case SolidWall:
			case SpringRedHorizontal: case Chopper:
				var Tolerance = 75;
			break;
			case StarPost:
				var Tolerance = 60;
			break;
			default:     
				var Tolerance = 50; 
			break;
		}
		depth = Player.DrawOrder - (depthFlag ? Tolerance : -Tolerance);
	}
	
	// Apply depth relative to another object
	else
	{
		depth = target.depth - (depthFlag ? 1 : -1);
	}
}