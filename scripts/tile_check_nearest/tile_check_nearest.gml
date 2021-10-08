/// @function tile_check_nearest(leftdata,rightdata,objectAngle)
function tile_check_nearest(leftdata,rightdata,objectAngle)
{
	// Use the left tile
	if leftdata[0] <= rightdata[0]
	{
		var ResultDistance = leftdata[0];
		var ResultAngle	   = leftdata[1];
	}
	
	// Else use the right tile
	else	
	{
		var ResultDistance = rightdata[0];
		var ResultAngle	   = rightdata[1];
	}
	
	// Is object angle defined?
	if objectAngle != noone
	{
		// Use cardinal angle if difference is higher than 45
		var Difference = abs(objectAngle mod 180 - ResultAngle mod 180);		
		if  Difference > 45 and Difference < 135
		{
			/* Originals also check for a bit flag set for tiles with angle
			0xFF, but we handle it right when we get tile data to make it more stable */
			   
			ResultAngle = round(objectAngle / 90) mod 4 * 90;
			if !ResultAngle
			{
				ResultAngle = 360;
			}
			
			// GHZRevisited: reset distance if higher than 2
			if ResultDistance > 2
			{
				ResultDistance = 32;
			}
		}
	}
	
	// Return data
	return [ResultDistance, ResultAngle];
}