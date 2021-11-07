function ObjGHZBossStartup()
{
	// Set blank values
	Xsp				  = 0;
	Ysp				  = 0;
	OffsetY			  = 0;
	Angle			  = 0;
	ChainOffset		  = 0;
	State			  = 0;
	StateTimer		  = 0;
	InvincibilityTime = 0;
	
	// Set other variables
	HP	 = 8;
	PosX = x;
	PosY = y;
	
	// Set object hitbox
	object_set_hitbox(24, 24);
	
	// Set object depth
	object_set_depth(Player, false);
}