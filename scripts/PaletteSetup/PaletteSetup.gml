function PaletteSetup()
{	
	switch room 
	{
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			palette_load(TypePrimary,   pal_ghz_type1);
			palette_load(TypeSecondary, noone);
		}
		break;
		default:
		{
			palette_load(TypePrimary,   noone);
			palette_load(TypeSecondary, noone);
		}
		break;
	}
}