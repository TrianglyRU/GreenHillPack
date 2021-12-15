function PlayerGroundFloorCollision()
{	
	// Exit if collisions are disabled or we are standing on the object
	if !AllowCollision or OnObject
	{
		exit;
	}
	
	// Get current angle quadrant normally, like in originals
	/*if Angle <= 45 or Angle >= 315
	{
		var CollisionMode = 0;
	}
	else if Angle >= 46.41 and Angle <= 133.59
	{
		var CollisionMode = 1;
	}
	else if Angle >= 135 and Angle <= 225
	{
		var CollisionMode = 2;
	}
	else if Angle >= 226.41 and Angle <= 313.59
	{
		var CollisionMode = 3;
	}*/
	
	// Update collision mode
	if !CollisionMode[1]
	{
		switch CollisionMode[0]
		{
			case 0:
			{
				var FindTile = tile_check_collision_h(PosX + RadiusY, PosY + RadiusX, true, false, Layer);
				if  FindTile[0] < 0
				{
					if FindTile[1] - Angle mod 360 < 45
					{
						CollisionMode[0] = 1;
					}
				}
			
				var FindTile = tile_check_collision_h(PosX - RadiusY, PosY + RadiusX, false, false, Layer);
				if  FindTile[0] < 0
				{
					if Angle - FindTile[1] < 45
					{
						CollisionMode[0] = 3;
					}
				}
			}
			break;
			case 1:	
			{
				var FindTile = tile_check_collision_v(PosX + RadiusX, PosY + RadiusY, true, false, Layer);
				if  FindTile[0] < 0
				{
					if Angle - FindTile[1] mod 360 < 45
					{
						CollisionMode[0] = 0;
					}
				}
			
				var FindTile = tile_check_collision_v(PosX + RadiusX, PosY - RadiusY, false, false, Layer);
				if  FindTile[0] < 0
				{
					if FindTile[1] - Angle < 45
					{
						CollisionMode[0] = 2;
					}
				}
			}
			break;
			case 2:
			{
				var FindTile = tile_check_collision_h(PosX + RadiusY, PosY - RadiusX, true, false, Layer);
				if  FindTile[0] < 0
				{
					if Angle - FindTile[1] < 45
					{
						CollisionMode[0] = 1;
					}
				}
			
				var FindTile = tile_check_collision_h(PosX - RadiusY, PosY - RadiusX, false, false, Layer);
				if  FindTile[0] < 0
				{
					if FindTile[1] - Angle < 45
					{
						CollisionMode[0] = 3;
					}
				}
			}
			break;
			case 3:
			{
				var FindTile = tile_check_collision_v(PosX - RadiusX, PosY + RadiusY, true, false, Layer);
				if  FindTile[0] < 0
				{
					if FindTile[1] - Angle < 45
					{
						CollisionMode[0] = 0;
					}
				}
			
				var FindTile = tile_check_collision_v(PosX - RadiusX, PosY - RadiusY, false, false, Layer);
				if  FindTile[0] < 0
				{
					if Angle - FindTile[1] < 45
					{
						CollisionMode[0] = 2;
					}
				}
			}
			break;
		}
	}
	else
	{
		CollisionMode[1] = false;
	}
	
	// Collide with floor
	switch CollisionMode[0]
	{
		case 0:
		{		
			// Get nearest tile below us
			var TileLeft    = tile_check_collision_v(PosX - RadiusX, PosY + RadiusY, true, false, Layer);
			var TileRight   = tile_check_collision_v(PosX + RadiusX, PosY + RadiusY, true, false, Layer);
		    var NearestTile = tile_check_nearest(TileLeft, TileRight, Angle);
				
			// Get data
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Xsp)), 14) : 14;
				if  FloorDistance > Distance
				{
					// Restart animation...?
					if Animation == AnimMove
					{
						// Restart animation...?
						animation_reset(0);
					}
					
					Pushing  = false;
					Grounded = false;
					break;
				}		
			}
			
			// Else collide
			if FloorDistance >= -14
			{
				PosY += FloorDistance;
				Angle = FloorAngle;	
			}
		}
		break;
		case 1:
		{	
			// Get nearest tile to our right
			var TileLeft    = tile_check_collision_h(PosX + RadiusY, PosY + RadiusX, true, false, Layer);
			var TileRight   = tile_check_collision_h(PosX + RadiusY, PosY - RadiusX, true, false, Layer);
			var NearestTile = tile_check_nearest(TileLeft, TileRight, Angle);
			
			// Get data
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Ysp)), 14) : 14;
				if  FloorDistance > Distance
				{
					// Restart animation...?
					if Animation == AnimMove
					{
						// Restart animation...?
						animation_reset(0);
					}
					
					Pushing  = false;
					Grounded = false;
					break;
				}	
			}
			
			// Else collide
			if FloorDistance >= -14
			{
				Angle = FloorAngle;
				PosX += FloorDistance;
			}
		}
		break;
		case 2:	
		{	
			// Get nearest tile above us
			var TileLeft    = tile_check_collision_v(PosX + RadiusX, PosY - RadiusY, false, false, Layer);
			var TileRight   = tile_check_collision_v(PosX - RadiusX, PosY - RadiusY, false, false, Layer);
			var NearestTile = tile_check_nearest(TileLeft, TileRight, Angle);
			
			// Get data
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Xsp)), 14) : 14;
				if  FloorDistance > Distance
				{
					// Restart animation...?
					if Animation == AnimMove
					{
						// Restart animation...?
						animation_reset(0);
					}
					
					Pushing  = false;
					Grounded = false;
					break;
				}
			}
			
			// Else collide
			if FloorDistance >= -14
			{
				Angle = FloorAngle;
				PosY -= FloorDistance;
			}
		}
		break;
		case 3:
		{	
			// Get nearest tile to our left
			var TileLeft    = tile_check_collision_h(PosX - RadiusY, PosY - RadiusX, false, false, Layer);
			var TileRight   = tile_check_collision_h(PosX - RadiusY, PosY + RadiusX, false, false, Layer);
			var NearestTile = tile_check_nearest(TileLeft, TileRight, Angle);
			
			// Get data
			var FloorDistance = NearestTile[0];
			var FloorAngle    = NearestTile[1];
			
			// Go airborne if surface is too far away from us
			if !StickToConvex
			{
				var Distance = Game.S2FloorCollision ? min(4 + abs(floor(Ysp)), 14) : 14;
				if  FloorDistance > Distance
				{
					// Restart animation...?
					if Animation == AnimMove
					{
						// Restart animation...?
						animation_reset(0);
					}
					
					Pushing  = false;
					Grounded = false;
					break;
				}
			}
				
			// Else collide
		    if FloorDistance >= -14
			{
				Angle = FloorAngle;
				PosX -= FloorDistance;
			}
		}
		break;
	}
}