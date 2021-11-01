function StagePaletteUpdate()
{
	switch room
	{
		// Update GHZ palette
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
			palette_handle(PaletteDry, 12, 4, 4, 1, 8);
		break;
		
		// Default
		default: break;
	}
}