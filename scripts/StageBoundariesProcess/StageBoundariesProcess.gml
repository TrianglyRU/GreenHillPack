function StageBoundariesProcess()
{	
	// Exit if stage update is disabled
	if !DoUpdate
	{
		exit;
	}

	// Update left boundary
	if LeftBoundary < TargetLeftBoundary
	{
		if Camera.ViewX >= TargetLeftBoundary
		{
			LeftBoundary = TargetLeftBoundary
		}
		else
		{
			if Camera.ViewX >= LeftBoundary
			{
				LeftBoundary = Camera.ViewX
			}
			LeftBoundary += 2;
		}
	}
	else if LeftBoundary > TargetLeftBoundary
	{
		LeftBoundary -= 2;
	}
	
	// Update right boundary
	if RightBoundary < TargetRightBoundary
	{
		RightBoundary += 2;
	}
	else if RightBoundary > TargetRightBoundary
	{
		if Camera.ViewX + Game.Width >= TargetRightBoundary
		{
			RightBoundary  = Camera.ViewX + Game.Width;
			RightBoundary -= 2;
		}
		else if Camera.ViewX + Game.Width <= TargetRightBoundary
		{
			RightBoundary = TargetRightBoundary
		}
	}
	
	// Update top boundary
	if TopBoundary < TargetTopBoundary
	{
		if Camera.ViewY >= TargetTopBoundary
		{
			TopBoundary = TargetTopBoundary
		}
		else
		{
			if Camera.ViewY > TopBoundary
			{
				TopBoundary = Camera.ViewY;
			}
			TopBoundary += 2;
		}
	}
	else if TopBoundary > TargetTopBoundary
	{
		TopBoundary -= 2;
	}
	
	// Update bottom boundary
	if BottomBoundary < TargetBottomBoundary
	{
		BottomBoundary += 2;
		DeathBoundary = TargetBottomBoundary;
	}
	else if BottomBoundary > TargetBottomBoundary
	{
		if Camera.ViewY + Game.Height >= TargetBottomBoundary
		{
			BottomBoundary  = Camera.ViewY + Game.Height
			BottomBoundary -= 2;
		}
		else if Camera.ViewY + Game.Height <= TargetBottomBoundary
		{
			BottomBoundary = TargetBottomBoundary;
		}
		DeathBoundary = BottomBoundary;
	}
	
	// Keep boundaries within the room size
	TopBoundary    = max(0,			  TopBoundary);
	LeftBoundary   = max(0,			  LeftBoundary);
	RightBoundary  = min(room_width,  RightBoundary);
	BottomBoundary = min(room_height, BottomBoundary);
	DeathBoundary  = min(room_height, DeathBoundary);
}