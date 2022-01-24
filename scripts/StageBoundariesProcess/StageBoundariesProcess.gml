function StageBoundariesProcess()
{	
	if Player.Death or fade_check(StateActive)
	{
		return;
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
			LeftBoundary = min(LeftBoundary + 2, TargetLeftBoundary);
		}
	}
	else if LeftBoundary > TargetLeftBoundary
	{
		LeftBoundary = max(TargetLeftBoundary, LeftBoundary - 2);
	}
	
	// Update right boundary
	if RightBoundary < TargetRightBoundary
	{
		RightBoundary = min(RightBoundary + 2, TargetRightBoundary)
	}
	else if RightBoundary > TargetRightBoundary
	{
		if Camera.ViewX + Game.Width >= TargetRightBoundary
		{
			RightBoundary = Camera.ViewX + Game.Width;
			RightBoundary = max(TargetRightBoundary, RightBoundary - 2);
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
			TopBoundary = min(TopBoundary + 2, TargetTopBoundary);
		}
	}
	else if TopBoundary > TargetTopBoundary
	{
		TopBoundary = max(TargetTopBoundary, TargetTopBoundary - 2);
	}
	
	// Update bottom boundary
	if BottomBoundary < TargetBottomBoundary
	{
		// Scroll faster in GHZ3
		var Speed = room == Stage_GHZ3 ? 16 : 2;
		
		BottomBoundary = min(BottomBoundary + Speed, TargetBottomBoundary);
		DeathBoundary  = TargetBottomBoundary;
	}
	else if BottomBoundary > TargetBottomBoundary
	{
		if Camera.ViewY + Game.Height >= TargetBottomBoundary
		{
			BottomBoundary = Camera.ViewY + Game.Height
			BottomBoundary = max(TargetBottomBoundary, BottomBoundary - 2);
		}
		else if Camera.ViewY + Game.Height <= TargetBottomBoundary
		{
			BottomBoundary = TargetBottomBoundary;
		}
		DeathBoundary = BottomBoundary;
	}
}