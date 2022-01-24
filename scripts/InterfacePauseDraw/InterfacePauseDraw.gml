function InterfacePauseDraw()
{	
	if !Stage.IsPaused
	{
		exit;
	}
	
	// Get screen centre
	var MenuX = Game.Width / 2;
	var MenuY = Game.Height / 2;
	
	// Draw pause menu
	draw_sprite(gui_pause_menu,	PauseTimer > 7 ? 0 : PauseValue + 1, MenuX, MenuY);
}