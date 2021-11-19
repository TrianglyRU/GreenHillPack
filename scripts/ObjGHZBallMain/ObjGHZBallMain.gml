function ObjGHZBallMain()
{
	// Calculate oscillate data
	var DistanceA = dsin((Stage.OscillateAngle * -GHZBoss.Angle) mod 360);
	var DistanceX = dcos(90 + DistanceA * 90) * 96;
	var DistanceY = dsin(90 + DistanceA * 90) * 96;
	
	// Calculate final position
	x = floor(GHZBoss.x + DistanceX);
	y = floor(GHZBoss.y + DistanceY + 32); 
	
	// Damage player
	if GHZBoss.HP and object_check_overlap(Hitbox)
	{
		player_damage(false, false, false);
	}
}