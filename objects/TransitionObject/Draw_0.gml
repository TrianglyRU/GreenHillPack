/// @description Draw
// You can write your code in this editor
	
	// Clear data
	Game.TransitionData = [];
	
	// Draw Clear Panel
	switch Game.Character
	{
		case CharSonic:
			var Sprite = spr_obj_clearpanel_end_s;
		break;
		case CharTails:
			var Sprite = spr_obj_clearpanel_end_t;
		break;
		case CharKnuckles:
			var Sprite = spr_obj_clearpanel_end_k;
		break;
	}
	draw_sprite(Sprite, 0, x, y - sprite_get_height(Sprite) div 2 + 1);