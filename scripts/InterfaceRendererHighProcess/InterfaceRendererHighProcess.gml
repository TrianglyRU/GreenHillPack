function InterfaceRendererHighProcess()
{
	// Set target surface and clear alpha
	surface_set_target(Game.RenderedSurface2);
	draw_clear_alpha(c_white, 0);
}