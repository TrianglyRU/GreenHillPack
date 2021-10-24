function MenuStartup()
{
	// Set default data for 20 MenuIDs
	for (var i = 0; i < 20; i++)
	{
		MenuSize[i]			= 0;
		MenuHeader[i]	    = "TEMPLATE HEADER";
		PreviousMenuID[i]   = 0;
	}
	
	// Set default saveslot display data
	for (var i = 0; i < 4; i++)
	{
		DisplayData[i] = 0;
	}
	
	// Set default Menu and Option IDs
	MenuID   = 0;
	OptionID = 0;
	
	// Set font and its align
	draw_set_font(game_font(font_menu));
	draw_set_halign(fa_center);
}