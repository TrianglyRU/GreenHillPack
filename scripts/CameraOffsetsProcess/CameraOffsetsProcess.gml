function CameraOffsetsProcess()
{	
	// Exit if camera is disabled or target is not player
	if !Enabled or Target != Player or !instance_exists(Target)
	{
		exit;
	}
	
	// Set vertical spin offset
	if Player.Spinning and Player.Grounded
	{
		SpinOffset = Player.DefaultRadiusY - Player.SmallRadiusY;
	} 
	else 
	{
		// Reset it
		if !Player.Grounded and SpinOffset
		{
			PosY -= Player.DefaultRadiusY - Player.SmallRadiusY;
		}
		SpinOffset = 0;
	}
	
	// Handle camera shake
	if ShakeTime
	{
		// We do not guarantee this is accurate, but this is somewhat original engine does
		ShakeX = irandom_range(8, 15)    * choose(-1, 1) * (1 + ShakeTime / 6) / 128;
		ShakeY = irandom_range(128, 255) * choose(-1, 1) * (1 + ShakeTime / 6) / 255;
		
		if !(--ShakeTime)
		{
			ShakeX = 0;
			ShakeY = 0;
		}
	}

	// Offset camera horizontally, like in CD
	if Game.CDCamera
	{
		var ScreenShift = Game.Width / 2 - 96;
		var ScreenSpeed = floor(ScreenShift / 32);
		
		if abs(Player.Inertia) >= 6 or Player.PeeloutRev >= 6
		{
			if !ScrollDelay and abs(ExtendedOffset) < ScreenShift
			{
				if abs(Player.Inertia) >= 6
				{
					ExtendedOffset += ScreenSpeed * sign(Player.Xsp);
				}
				else if Player.PeeloutRev >= 6
				{
					ExtendedOffset += ScreenSpeed * Player.Facing;
				}
			}
		}
		else
		{
			ExtendedOffset -= ScreenSpeed * sign(ExtendedOffset);
		}
	}
	
	// Check for overview delay
	var ShiftDown = Player.Animation == AnimCrouch;
	var ShiftUp   = Player.Animation == AnimLookup;
	
	if (ShiftUp or ShiftDown)
	{
		if OverviewDelay
		{
			OverviewDelay--;
		}
	}
	else if Game.SpindashEnabled or Game.PeeloutEnabled
	{
		OverviewDelay = 120;
	}
	
	// Offset vertically
	if (ShiftUp or ShiftDown) and !OverviewDelay
	{
		if ShiftDown and OverviewOffset < 88 
		{
			OverviewOffset += 2;
		}
		if ShiftUp and OverviewOffset > -104 
		{
			OverviewOffset -= 2;
		} 	
	} 
	else if OverviewOffset != 0
	{
		OverviewOffset -= 2 * sign(OverviewOffset);
	}
}