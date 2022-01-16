/// @description Main
// You can write your code in this editor
	
	// Destroy if player is not under invincibility bonus
	if !Player.InvincibleBonus or Player.SuperState
	{
		instance_destroy(); exit;
	}
	
	// Limit offset
	PositionOffset = loop_value(PositionOffset, 0 + ID * 6, 6 + ID * 6);
	
	// Update position
	x = Player.RecordedPosX[| PositionOffset];
	y = Player.RecordedPosY[| PositionOffset];
	
	// Shift offset
	PositionOffset++;