function PaletteSurfaceProcess()
{	
	surface_set_target(application_surface);
	draw_clear_alpha(c_white, 0);
	
	if surface_exists(SurfaceMain) 
	{
		// Use shader
		shader_set(ShaderPalette);
		
		// Render palette fade
		shader_set_uniform_f(Shader.PalStep,   FadeBlend == BlendFlash ? FadeStep div 3 : FadeStep);
		shader_set_uniform_i(Shader.PalColour, FadeBlend);
		shader_set_uniform_i(Shader.PalMode,   FadeMode);
		
		// Define a render boundary between type 1 and type 2 palettes
		if instance_exists(Stage) and Stage.WaterEnabled
		{
			var Boundary = Game.Height - clamp(Camera.ViewY - Stage.WaterLevel + Game.Height, 0, Game.Height);
		}
		else
		{
			var Boundary = Game.Height;
		}
	
		// Transfer boundary data into the shader
		shader_set_uniform_f(Shader.PalBoundary, Boundary);
		
		// Render palette type 1
		if Boundary > 0 and ColourSet[TypePrimary] != false
		{
			shader_set_uniform_f_array(Shader.PalIndex1, IndexType1);
			texture_set_stage(Shader.PalTex1,			 ColourSet[0][0]);
			shader_set_uniform_f(Shader.PalTexelSize1,   ColourSet[0][1], ColourSet[0][2]);
			shader_set_uniform_f(Shader.PalUVs1,		 ColourSet[0][3], ColourSet[0][4], ColourSet[0][5]);
		}
		
		// Render palette type 2
		if Boundary < Game.Height and ColourSet[TypeSecondary] != false
		{
			texture_set_stage(Shader.PalTex2,			 ColourSet[1][0]);
			shader_set_uniform_f_array(Shader.PalIndex2, IndexType2);
			shader_set_uniform_f(Shader.PalTexelSize2,   ColourSet[1][1], ColourSet[1][2]);
			shader_set_uniform_f(Shader.PalUVs2,		 ColourSet[1][3], ColourSet[1][4], ColourSet[1][5]);
		}
		
		// Render main surface
		draw_surface(SurfaceMain, 0, 0);
		shader_reset();
	}
	
	// Render overlay surface
	if surface_exists(SurfaceOverlay)
	{
		draw_surface(SurfaceOverlay, 0, 0);
	}
	surface_reset_target();
	
	// Draw application surface
	application_surface_draw_enable(true);
	draw_surface(application_surface, 0, 0);
	application_surface_draw_enable(false);
}