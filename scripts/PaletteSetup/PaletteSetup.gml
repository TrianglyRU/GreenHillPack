function PaletteSetup()
{	
	switch room 
	{	
		// Load SEGA palette
		case Screen_SEGA:
		{
			palette_load(TypePrimary,   pal_sega);
			palette_load(TypeSecondary, noone);
		}
		break;
		
		// Load title palette
		case Screen_Title:
		{
			palette_load(TypePrimary,   pal_title);
			palette_load(TypeSecondary, noone);
		}
		break;
		
		// Load GHZ palette
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			palette_load(TypePrimary,   pal_ghz_dry);
			palette_load(TypeSecondary, noone);
		}
		break;
		
		// Do not load any palettes by default
		default:
		{
			palette_load(TypePrimary,   noone);
			palette_load(TypeSecondary, noone);
		}
		break;
	}
}