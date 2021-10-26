/// @function object_act_solid(sides,top,bottom,resetActions)
function object_act_solid(sides,top,bottom,resetActions)
{
	/* The following is long and replicates originals method of colliding with object,
	however it was tweaked in several places to make collision much more consistent */
	
	// Clear touch flags
	Obj_SolidTouchU	= false;
	Obj_SolidTouchD	= false;
	Obj_SolidTouchL	= false;
	Obj_SolidTouchR	= false;
	
	// Exit if collisions are disabled
	if !Player.AllowCollision
	{
		exit;
	}
	
	// Exit if no solid radiuses were initialized for this object
	if !variable_instance_exists(id, "Obj_SolidStatus")
	{
		exit;
	}
	
	// Exit if object can't be collided
	if !Obj_SolidX or !Obj_SolidY
	{
		exit;	
	}
	
	// Exit if there is no side to collide with 
	if !sides and !top and !bottom
	{
		exit;
	}
	
	// Exit if object is off-screen
	if !object_is_onscreen(id)
	{
		exit;
	}
	
	// Get object and player data
	var PlayerX      = floor(Player.PosX);
	var PlayerY      = floor(Player.PosY);
	var ObjectID	 = id;
	var ObjectX		 = x;
	var ObjectY      = y;
	var ObjectWidth  = Obj_SolidX + Player.RadiusW + 1;
	var ObjectHeight = Obj_SolidY + Player.RadiusY + 1;
	
	// Get height array
	if Obj_SolidMap != false
	{
		// Get a height to use
		if image_xscale
		{
			var ArrayHeight = PlayerX - (x - Obj_SolidX);
		}
		else
		{
			var ArrayHeight = (x + Obj_SolidX - 1) - PlayerX;
		}	
		ArrayHeight = clamp(ArrayHeight, 0, array_length(Obj_SolidMap) - 1);
		
		// Calculate height difference
		var SlopeOffset = (Obj_SolidY * 2 - Obj_SolidMap[ArrayHeight]) * image_yscale;	
	}
	else
	{
		var SlopeOffset = 0;
	}
	
	// If player is standing on this object, collide only with its top side
	if Player.OnObject == ObjectID
	{	
		Player.PosX += floor(x - xprevious);
		Player.PosY  = ObjectY - Obj_SolidY - Player.RadiusY + SlopeOffset - 1;
			
		// Tell the object player touches its top side
		Obj_SolidTouchU = true;
		
		// Check if player is outside the object
		var FallRadius = sides ? ObjectWidth : Obj_SolidX + 1;
		
		var XComparison = floor(Player.PosX) - ObjectX + FallRadius;
		if  XComparison <= 0 or XComparison >= FallRadius * 2 - 1
		{
			Player.OnObject = false;
		}
	}
			
	// If player is not standing on this object, collide with it
	else
	{	
		// Check for overlap
		var XDifference = PlayerX - ObjectX + ObjectWidth;
		if  XDifference < 0 or XDifference > ObjectWidth * 2 - 1
		{
			exit;
		}
		var YDifference = PlayerY - ObjectY - SlopeOffset + ObjectHeight + 4;
		if  YDifference < 0 or YDifference > ObjectHeight * 2 + 3
		{
			exit;
		}
		
		// Get distance differences
		var XDistance = PlayerX > ObjectX ? XDifference - ObjectWidth  * 2 + 1 : XDifference;
		var YDistance = PlayerY > ObjectY ? YDifference - ObjectHeight * 2 - 3 : YDifference;
		
		// Collide vertically
		if abs(XDistance) >= abs(YDistance)
		{	
			// Collide below
			if bottom and YDistance < 0
			{
				if PlayerY > ObjectY
				{
					// Kill player
					if Player.Grounded
					{
						if abs(XDistance) >= 16 and Player.Ysp == 0
						{
							player_damage(false, false, true);
						}
					}
				
					// Clip out
					else if Player.Ysp <= 0
					{
						if Player.FlightState
						{
							Player.Grv = 0.03125;
						}
					
						Player.PosY -= YDistance;
						Player.Ysp   = 0;
					}
				
					// Tell the object player touches its bottom side
					Obj_SolidTouchD = true;
				}
			}
			
			// Collide above
			else if top and YDistance >= 4 and YDistance < 16 //>= 0
			{
				if PlayerY < ObjectY
				{
					if Player.Ysp >= 0
					{
						// Exit if outside the object
						var LandRadius = sides ? ObjectWidth : Obj_SolidX + 1;
					
						var XDifference = PlayerX - ObjectX + LandRadius;
						if  XDifference <= 0 or XDifference >= LandRadius * 2 - 1
						{
							exit;
						}
						with Player
						{
							// Attach player to the object's top boundary
							PosY -= YDistance - 4;
					
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
					
						// Tell the object player touches its top side
						Obj_SolidTouchU = true;
					}
				}
			}		
		}
		
		// Collide horizontally
		else if sides and abs(YDistance) > 4
		{		
			if XDistance != 0 and sign(XDistance) == sign(Player.Xsp)
			{
				// Tell the object it is being pushed
				if PlayerX < ObjectX
				{
					Obj_SolidTouchL = true;
				}
				else
				{
					Obj_SolidTouchR = true;
				}
				
				// Make player push the object
				if Player.Grounded
				{
					Player.Pushing = true;
				}
				
				// Reset speeds
				Player.Inertia = 0;
				Player.Xsp	   = 0;
			}
			
			// Clip player outside
			Player.PosX -= XDistance;
		}
	}
}