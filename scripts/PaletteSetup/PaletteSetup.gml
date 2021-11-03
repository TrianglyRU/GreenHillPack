function PaletteSetup()
{	
	switch room 
	{	
		// Load SEGA palette
		case Screen_SEGA:
		{
			palette_load(PaletteDry, pal_sega);
			palette_load(PaletteWet, noone);
		}
		break;
		
		// Load GHZ palette
		case Stage_GHZ1:
		case Stage_GHZ2:
		case Stage_GHZ3:
		{
			palette_load(PaletteDry, pal_ghz_dry);
			palette_load(PaletteWet, noone);
		}
		break;
		
		// Do not load any palettes by default
		default:
		{
			palette_load(PaletteDry, noone);
			palette_load(PaletteWet, noone);
		}
		break;
	}
}