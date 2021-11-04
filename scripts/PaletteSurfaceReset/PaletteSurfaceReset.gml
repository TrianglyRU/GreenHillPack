function PaletteSurfaceReset()
{
	// Reset surfaces
	/*
	if surface_exists(SurfaceLow) 
	{
		surface_free(SurfaceLow);
		view_surface_id[0] = application_surface;
	}
	*/
	if surface_exists(SurfaceHigh) 
	{
		surface_free(SurfaceHigh);	
	}
}