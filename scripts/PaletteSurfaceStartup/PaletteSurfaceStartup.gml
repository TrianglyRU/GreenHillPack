function PaletteSurfaceStartup()
{
	// Create surfaces
	if !surface_exists(SurfaceMain)
	{
		SurfaceMain = surface_create(Game.Width, Game.Height); view_surface_id[0] = SurfaceMain;
	}
	if !surface_exists(SurfaceOverlay)
	{
		SurfaceOverlay = surface_create(Game.Width, Game.Height);
	}
}