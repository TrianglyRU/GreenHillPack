function ObjSpikeBridgeMain()
{
	// Damage player
	if image_index == 0 and object_check_overlap(Hitbox)
	{
		player_damage(false, false, false);
	}
	
	// Play animation
	animation_play_sync(sprite_index, 12);
	
	// Offset frame
	image_index += (7 - StartFrame);
}