function BackgroundProcess()
{	
	if !Game.StageTransitions
	{
		/* This is not needed for stages built with stage transition in mind,
		so it can be ignored. Normally, it should be always 0 */
		
		// Since we extended the room size, scroll the background back to its initial position
		// by subtracting the initial camera position
		if room == Stage_GHZ2
		{
			var TransitionOffset = -2048;
		}
		else if room == Stage_GHZ3
		{
			var TransitionOffset = -512;
		}
		else
		{
			var TransitionOffset = 0;
		}
	}
	else
	{
		// Formula: "XDistance camera passed in the previous act(s)" - "initial camera PosX for this act after the transition"
		var DistanceGHZ1 = 9568  - Game.Width / 2 - (352 - Game.Width / 2);
		var DistanceGHZ2 = 10080 - Game.Width / 2 + DistanceGHZ1 - (352 - Game.Width / 2);
		
		switch room
		{
			case Stage_GHZ2: var TransitionOffset = DistanceGHZ1; break;
			case Stage_GHZ3: var TransitionOffset = DistanceGHZ2; break;
			default:         var TransitionOffset = 0;			  break;
		}
	}
	
	// Main Code
	#region Background Code
	{
		draw_clear(BGColour);
		shader_set(ShaderParallax);
	
		var Length = array_length(BGSprites);
		for (var i = 0; i < Length; i++)
		{
			// Update autoscroll value
			if Game.UpdateAnimations
			{
				BGValues[i][12] += BGValues[i][4];
			}
		
			// Get background data
			var PosX	      = BGValues[i][0];
			var PosY	      = BGValues[i][1];
			var ScrollX	      = BGValues[i][2];
			var ScrollY	      = BGValues[i][3];
			var InclineHeight = BGValues[i][5];
			var InclineStep   = BGValues[i][6];
			var InclineY      = BGValues[i][7];
			var AnimSpeed     = BGValues[i][8];
			var Height	      = BGValues[i][9];
			var Width	      = BGValues[i][10];
			var MapSize       = BGValues[i][11];
			var AutoXOffset	  = BGValues[i][12];
		
			// Define draw position
			var DrawX = Camera.ViewX 					    + PosX;
			var DrawY = floor(Camera.ViewY * (1 - ScrollY)) + PosY;
		
			// Set y-scale mode properties
			if InclineY and instance_exists(Stage)
			{
				var YScale = clamp((Stage.WaterLevel - DrawY) / Height, -1, 1);
			} 
			else 
			{
				YScale = 1;
			}
			
			// Get a frame to display
			if !AnimSpeed
			{
				var Frame = 0;
			}
			else
			{
				var Frame = Game.AnimationTime[? GlobalTime] div AnimSpeed mod sprite_get_number(BGSprites[i]);
			}
		
			// Transfer data to the shader
			if InclineHeight != 0 
			{
				shader_set_uniform_f(Shader.PrlIncStep,   InclineStep / ScrollX);
				shader_set_uniform_f(Shader.PrlIncHeight, InclineHeight);
				shader_set_uniform_f(Shader.PrlYScale,    YScale);
			}
			shader_set_uniform_f(Shader.PrlOffset, (DrawX - PosX) * ScrollX - AutoXOffset + TransitionOffset * ScrollX);
			shader_set_uniform_f(Shader.PrlPos,     DrawX, DrawY);
			shader_set_uniform_f(Shader.PrlWidth,   Width);
			shader_set_uniform_f(Shader.PrlMapSize, MapSize);
		
			// Draw background piece
			if InclineY
			{
				draw_sprite_ext(BGSprites[i], Frame, DrawX, DrawY, 1, YScale, 0, c_white, 1);
			}
			else
			{
				draw_sprite(BGSprites[i], Frame, DrawX, DrawY);
			}
			if InclineHeight != 0 
			{
				shader_set_uniform_f(Shader.PrlIncHeight, 0);
			}
		}
		shader_reset();
	}
	#endregion
}