function StagePaletteUpdate()
{
	switch room
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
			palette_handle_range(TypePrimary, 11, 14, 4, 1, 8);
		break;
		default: break;
	}
}