/// @function object_check_overlap(collisionType)
function object_check_overlap(collisionType)
{	
	// Exit if hitbox collision is disabled
	if collisionType == Hitbox and !Player.AllowCollision
	{
		return false;
	}

	// Check for hitbox overlap
	if collisionType == Hitbox
	{
		// Exit if this object hitbox wasn't initialized
		if !variable_instance_exists(id, "Obj_HitStatus")
		{
			return false;
		}
		
		// Exit if object can't be overlapped
		if !Obj_HitX or !Obj_HitY
		{
			return false;
		}
		
		// Exit if object is off-screen
		if !object_is_onscreen(id)
		{
			exit;
		}
		
		// Get object's size
		var ObjectTop    = floor(y - Obj_HitY - 0);
		var ObjectLeft   = floor(x - Obj_HitX - 0);
		var ObjectRight  = floor(x + Obj_HitX - 1);
		var ObjectBottom = floor(y + Obj_HitY - 1);
		
		// Get player's hitbox
		if Game.Character != CharTails and Player.Animation == AnimCrouch and Player.image_index == Player.image_number - 1
		{
			var PlayerTop    = floor(Player.PosY - 4);
			var PlayerLeft   = floor(Player.PosX - 8);
			var PlayerRight  = floor(Player.PosX + 8);
			var PlayerBottom = floor(Player.PosY + 16);		
		}
		else
		{
			var PlayerTop    = floor(Player.PosY - Player.RadiusY + 3);
			var PlayerLeft   = floor(Player.PosX - 8);
			var PlayerRight  = floor(Player.PosX + 8);
			var PlayerBottom = floor(Player.PosY + Player.RadiusY - 3);	
		}
		
		// Check for overlap
		if PlayerRight < ObjectLeft or PlayerLeft > ObjectRight
		{
			return false;
		}
		else if PlayerBottom < ObjectTop or PlayerTop > ObjectBottom
		{
			return false;
		}
		
		// If player overlaps object on both axis, they collided with it
		return true;
	}
	
	
	else if collisionType == Solidbox
	{
		// Exit if this object solidbox wasn't initialized
		if !variable_instance_exists(id, "Obj_SolidStatus")
		{
			return false;
		}
		
		// Exit if object can't be overlapped
		if !Obj_SolidX or !Obj_SolidY
		{
			return false;
		}
		
		// Exit if object is off-screen
		if !object_is_onscreen(id)
		{
			exit;
		}
		
		// Get object's size
		var ObjectTop    = floor(y - Obj_SolidY - 0);
		var ObjectLeft   = floor(x - Obj_SolidX - 0);
		var ObjectRight  = floor(x + Obj_SolidX - 1);
		var ObjectBottom = floor(y + Obj_SolidY - 1);
		
		// Get player's solidbox
		var PlayerTop    = floor(Player.PosY - Player.RadiusY);
		var PlayerLeft   = floor(Player.PosX - Player.RadiusX);
		var PlayerRight  = floor(Player.PosX + Player.RadiusX);
		var PlayerBottom = floor(Player.PosY + Player.RadiusY);
		
		// Check for overlap
		if PlayerRight < ObjectLeft or PlayerLeft > ObjectRight
		{
			return false;
		}
		else if PlayerBottom < ObjectTop or PlayerTop > ObjectBottom
		{
			return false;
		}
		
		// If player overlaps object on both axis, they collided with it
		return true;
	}
	
	// Check for triggerbox overlap
	else if collisionType == Triggerbox
	{
		// Exit if this object triggerbox wasn't initialized
		if !variable_instance_exists(id, "Obj_TriggerStatus")
		{
			return false;
		}
		
		// Return check result
		return point_in_rectangle(floor(Player.PosX), floor(Player.PosY), floor(x + Obj_TriggerLeft), floor(y + Obj_TriggerTop), floor(x + Obj_TriggerRight - 1), floor(y + Obj_TriggerBottom - 1));
	}
}