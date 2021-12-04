function InterfacePauseDraw()
{	
	// Exit if stage is not paused
	if !Stage.IsPaused
	{
		exit;
	}
	
	// Get pause position
	var MenuX = Game.Width / 2;
	var MenuY = Game.Height / 2;
	
	// Draw pause menu
	draw_sprite(gui_pause_menu,	PauseTimer div 8 ? 0 : PauseValue + 1,MenuX, MenuY);
}