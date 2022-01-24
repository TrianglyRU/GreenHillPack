function InterfaceGameOverDraw()
{
	if !Stage.RestartEvent
	{
		exit;
	}
	
	// Update position
	GameOverValue[0] = min(GameOverValue[0] + 16, Game.Width / 2 - 40);
	GameOverValue[1] = max(GameOverValue[1] - 16, Game.Width / 2 + 40);
	
	// Draw assets
	draw_sprite(gui_hud_gametime, Stage.Time == 36000 and Player.Lives, GameOverValue[0], Game.Height / 2);
	draw_sprite(gui_hud_over,	   0,									 GameOverValue[1], Game.Height / 2);
}