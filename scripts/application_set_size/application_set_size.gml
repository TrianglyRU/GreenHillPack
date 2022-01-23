/// @function application_set_size(width,height)
function application_set_size(width,height)
{	
	// Set camera and surface size
	window_set_size(width * Game.WindowSize, height * Game.WindowSize);
	camera_set_view_size(GameCamera, width, height);

	// Update surfaces
	if surface_exists(Palette.SurfaceMain)
	{
		surface_resize(Palette.SurfaceMain, width, height);
	}
	if surface_exists(Palette.SurfaceOverlay)
	{
		surface_resize(Palette.SurfaceOverlay, width, height);
	}
	surface_resize(application_surface, width, height);
	
	// Update room size
	if !instance_exists(Stage)
	{
		room_width  = Game.Width;
		room_height = Game.Height;
	}
}