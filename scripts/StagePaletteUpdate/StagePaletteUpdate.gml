function StagePaletteUpdate()
{
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			if Game.Character == CharTails
			{
				palette_set_colour_range(TypePrimary, 0, 3, 22);
			}
			else if Game.Character == CharKnuckles
			{
				palette_set_colour_range(TypePrimary, 0, 3, 23);
			}
			palette_handle_range(TypePrimary, 11, 14, 4, 1, 8);
		}
		break;
		default: break;
	}
}