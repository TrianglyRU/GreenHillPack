/// @description Main
// You can write your code in this editor
	
	// Damage player
	if image_index == 0 and object_check_overlap(TypeHitbox)
	{
		player_damage(false, false, false);
	}
	
	// Play animation
	animation_play_sync(sprite_index, 12);
	
	// Offset frame
	image_index += (7 - StartFrame);