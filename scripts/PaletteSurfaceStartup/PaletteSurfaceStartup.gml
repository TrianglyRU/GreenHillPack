function PaletteSurfaceStartup()
{
	// Create low surface
	if !surface_exists(Game.RenderedSurface1)
	{
		Game.RenderedSurface1 = surface_create(Game.Width, Game.Height);
		view_surface_id[0] = Game.RenderedSurface1;
	}
	
	// Create high surface
	if !surface_exists(Game.RenderedSurface2)
	{
		Game.RenderedSurface2 = surface_create(Game.Width, Game.Height);
	}
}