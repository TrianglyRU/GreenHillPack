/// @function application_set_size(width,height)
function application_set_size(width,height)
{	
	// Set camera and surface size
	camera_set_view_size(GameCamera, width, height);
	surface_resize(application_surface, width, height);

	// Resize palette surfaces
	if surface_exists(Game.RenderedSurface1)
	{
		surface_resize(Game.RenderedSurface1, width, height);
	}
	if surface_exists(Game.RenderedSurface2)
	{
		surface_resize(Game.RenderedSurface2, width, height);
	}
	
	// Update room size
	if !instance_exists(Stage)
	{
		room_width  = Game.Width;
		room_height = Game.Height;
	}
	
	// Re-enable surface rendering
	application_surface_draw_enable(true);
}