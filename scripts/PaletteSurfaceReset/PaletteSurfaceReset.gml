function PaletteSurfaceReset()
{
	/* This script will be called on room end */
	if !SurfaceReset
	{
		return;
	}
	
	// Reset surfaces
    if surface_exists(SurfaceMain) 
    {
        surface_free(SurfaceMain);
    }
    if surface_exists(SurfaceOverlay) 
    {
        surface_free(SurfaceOverlay);    
    }
}