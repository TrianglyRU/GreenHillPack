/// @description Main
// You can write your code in this editor
	
	// Calculate oscillate data
	var DistanceA = dsin((Stage.OscillateAngle * -GHZBoss.Angle) mod 360);
	var DistanceX = dcos(90 + DistanceA * 90) * 96;
	var DistanceY = dsin(90 + DistanceA * 90) * 96;
	
	// Calculate final position
	if GHZBoss.State >= 4
	{
		x = floor(GHZBoss.x + DistanceX);
		y = floor(GHZBoss.y + DistanceY + 32);
	}
	else
	{
		// Increment distance
		PathDistance = min(128, PathDistance + 1.5);
		
		x = floor(GHZBoss.x);
		y = floor(GHZBoss.y + PathDistance);
	}
	
	// Damage player
	if GHZBoss.HP and object_check_overlap(TypeHitbox)
	{
		if !Player.DoubleSpinAttack
		{
			player_damage(false, false, false);
		}
	}