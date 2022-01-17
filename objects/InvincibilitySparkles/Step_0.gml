/// @description Main
// You can write your code in this editor

	// Destroy if player is not under invincibility bonus
	if !Player.InvincibleBonus or Player.SuperState
	{
		instance_destroy(); exit;
	}
	
	// Offset position
	for (var i = 0; i < 4; i++)
	{
		PositionOffset[i] = loop_value(PositionOffset[i], 0 + i * 6, 6 + i * 6);
		PositionOffset[i] += 1;
	}
	Timer++;
	
	// Follow player
	x = Player.PosX;
	y = Player.PosY;