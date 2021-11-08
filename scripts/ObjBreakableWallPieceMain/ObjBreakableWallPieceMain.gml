function ObjBreakableWallPieceMain()
{
	// Move object
	PosX += Xsp;
	PosY += Ysp;
	
	// Apply gravity
	Ysp += Grv;
	
	// Update position
	x = floor(PosX);
	y = floor(PosY);
}