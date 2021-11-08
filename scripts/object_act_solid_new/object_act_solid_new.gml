/// @function object_act_solid_new(sides,top,bottom,resetActions)
function object_act_solid_new(sides,top,bottom,resetActions)
{
	// Clear touch flags
	Obj_SolidTouchU	= false;
	Obj_SolidTouchD	= false;
	Obj_SolidTouchL	= false;
	Obj_SolidTouchR	= false;
	Obj_SolidPush   = false;
	
	var width  = Obj_SolidX //* 2;
	var height = Obj_SolidY //* 2;
	
	// Check if we're standing on the object
	if Player.OnObject == id
	{
		var xDiff = floor(Player.PosX - xprevious) + width;
		
		if xDiff < 0 or xDiff > width * 2
		{
			Player.OnObject = false;
			Player.Grounded = false;
		}
		else
		{
			// Get top
			var Top = floor(y - height);
			
			// Move with platform
			Player.PosX += floor(x - xprevious);
			Player.PosY  = Top - Player.RadiusY;
		}
	}
	
	// Collide
	else
	{
		var heightHalf = height + Player.RadiusY;
		
		// Check if we're within horizontal range
		var xDiff = floor(Player.PosX - x) + width;
		if !(xDiff >= 0 and xDiff < width)
		{
			exit;
		}
		
		
		
		// Check if we're within vertical range
		var yDiff = (floor(Player.PosY - y) + 4) + heightHalf;
		
		height = heightHalf * 2;
		
		if !(yDiff >= 0 and yDiff <= height)
		{
			exit;
		}
		
		// Get clip differences
		var xClip  = xDiff;
		if  xDiff >= width
		{
			xDiff -= width * 2;
			xClip  = -xDiff;
		}
		var yClip  = yDiff;
		if  yDiff >= heightHalf
		{
			yDiff -= (4 + height);
			yClip  = -yDiff;
		}
		
		if (xClip >= yClip)
		{
			// Collide from below
			if (yDiff < 0)
			{
				if Player.Grounded and Player.Ysp == 0
				{
					if abs(xClip) >= 16
					{
						player_damage(false, false, true);
						Obj_SolidTouchD = true;
					}
				}
				else
				{
					if Player.Ysp < 0
					{
						Player.PosY -= yDiff;
						Player.Ysp   = 0;
					}
					Obj_SolidTouchD = true;
				}
			}
			
			// Collide from above
			else
			{
				if yDiff < 16
				{
					yDiff -= 4;
					
					var ObjectID = id;
					
					var xDiff2 = floor(Player.PosX - xprevious) + width;
					if  xDiff2 >= 0 and xDiff2 < width * 2 and Player.Ysp >= 0
					{
						// Attach
						with Player
						{
							PosY -= (yDiff + 1);
					
							// Become grounded
							Grounded = true;
							OnObject = ObjectID;
					
							// Update horizontal speed and angle
							Inertia  = Xsp;
							Angle    = 360;
						
							// If interactable, cancel barrier ability and dropdash
							if resetActions
							{
								BarrierIsActive = false;
								DropdashRev		= -1;
							}
						
							// Land
							PlayerResetOnFloor();
						}	
						Obj_SolidTouchU = true;
					}
				}
				
				// Clear push
				/**/
			}
		}
		
		// Exit if clipped under 4 pixels verically
		if yClip <= 4
		{
			exit;
		}
		
		// Hault velocity
		if xDiff > 0 and Player.Xsp >= 0
		or xDiff < 0 and Player.Xsp  < 0
		{
			Player.Inertia = 0;
			Player.Xsp	   = 0;
		}
		Player.PosX -= xDiff;
		
		if floor(Player.PosX) < x
		{
			Obj_SolidTouchL = true;
		}
		else
		{
			Obj_SolidTouchR = true;
		}
		
		Obj_SolidPush  = Player.Grounded;
		Player.Pushing = Player.Grounded;
	}
}