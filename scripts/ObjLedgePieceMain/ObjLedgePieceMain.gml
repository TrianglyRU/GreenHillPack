function ObjLedgePieceMain()
{
	// Fall
	if !(--Timer)
	{
		Ysp += 0.21875;
		PosY += Ysp;
		
		// Update position
		y = floor(PosY);
	}
}