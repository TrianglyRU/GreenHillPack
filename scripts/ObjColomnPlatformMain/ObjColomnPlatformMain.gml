function ObjColomnPlatformMain()
{	
	// Get initial position
	var PosY = OriginY;
	
	// Update oscillate angle
	var Angle = (1.425 * Stage.Time) mod 360;
	
	// Move platform
	PosY += dsin(Angle) * 32;

	// Update position
	y = floor(PosY);
	
	// Do collision
	object_act_solid(true, true, false, false);
}