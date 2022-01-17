/// @description Startup
// You can write your code in this editor
	
	// Initialise variables
	PosX			  = x;
	PosY		      = y;
	HP				  = 8;
	Xsp				  = 0;
	Ysp				  = 1;
	OffsetY			  = 0;
	Angle			  = 0;
	ChainOffset		  = 0;
	State			  = 1;
	StateTimer		  = 172;
	ExplosionTimer	  = 0;
	InvincibilityTime = 0;
	
	// Set object properties
	object_set_hitbox(24, 24);
	object_set_depth(Player, 0);