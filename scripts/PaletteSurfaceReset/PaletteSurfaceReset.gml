function PaletteSurfaceReset()
{
	/* This script will be called on room end */
	if !DoReset
	{
		return;
	}
	
	// Reset surfaces
    if surface_exists(SurfaceLow) 
    {
        surface_free(SurfaceLow);
    }
    if surface_exists(SurfaceHigh) 
    {
        surface_free(SurfaceHigh);    
    }
}