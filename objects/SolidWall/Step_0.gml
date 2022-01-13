/// @description Main
// You can write your code in this editor
	
	// Do collision
	if IsSolid and !Player.ClimbState
	{
		object_act_solid(true, false, false, false);
	}