/// @description Draw
// You can write your code in this editor
	
	// Get local time
	var LocalTime = (Timer - 1) mod 6;
	
	for (var i = 0; i < 4; i++)
	{
		var Offset = max(0, PositionOffset[i] - 1);
		var PosX   = floor(Player.RecordedPosX[| Offset]);
		var PosY   = floor(Player.RecordedPosY[| Offset]);
		
		switch i
		{
			case 3:
			{
				if LocalTime mod 3 == 0
				{
					draw_animated_sprite(spr_obj_invsparkles, 6, true, PosX, PosY);
				}
			}
			break;
			case 2:
			{
				if LocalTime != 2 and LocalTime < 4
				{
					draw_animated_sprite(spr_obj_invsparkles, 6, true, PosX, PosY);
				}
			}
			break;
			case 1:
			{
				if (LocalTime + 1) mod 3 != 0
				{
					draw_animated_sprite(spr_obj_invsparkles, 6, true, PosX, PosY);
				}
			}
			break;
			case 0: 
			{
				draw_animated_sprite(spr_obj_invsparkles, 6, true, PosX, PosY); 
			}
			break;
		}
	}