function PlayerResetOnFloor()
{	
	// Grounded flag set when airborne means we've landed
	if !Grounded
	{
		exit;
	}
	
	// Is water barrier active?
	if BarrierIsActive and BarrierType == BarrierWater 
	{
		// Set speeds
		var Force = IsUnderwater ? -4 : -7.5;
		Ysp = Force * dcos(Angle);
		Xsp = Force * dsin(Angle);
		
		// Reset flags
		BarrierIsActive = false;
		Grounded        = false;
		OnObject	    = false;

		// Set barrier animation
		with Barrier
		{
			animation_set(spr_obj_barrier_water_bounce, 0);
		}
		
		// Play sound
		audio_sfx_play(sfxWaterBarrierBounce, false);
	}
	else
	{
		// Set animation if landed on solid ground
		if !OnObject
		{
			if Animation != AnimIdle and Animation != AnimGetUp
			{
				Animation = AnimMove;
			}
		}
		
		// Clear spinning flag
		if !(OnObject and Ysp == 0)
		{
			Spinning = false;
		}
	
		// Reset flags
		Jumping		= false;
		AirLock		= false;
		Pushing		= false;
		FlightState = false;
		GlideState  = false;
		ClimbState	= false;
		ScoreCombo	= false;
		BarrierIsActive = false;
		DropdashFlag	= -1;
	
		// Stop sounds
		audio_sfx_stop(sfxFlying);
		audio_sfx_stop(sfxTired);
	
		// Set visual angle
		if !Game.SmoothRotation and (Angle >= 23.91 and Angle <= 337.50)
		or  Game.SmoothRotation and (Angle >= 33.75 and Angle <= 326.25)
		{
			VisualAngle = Angle;
		}
		else
		{
			VisualAngle = 360;
		}
		
		// Clear hurt state
		if Hurt
		{
			Hurt	= false;	
			Inertia = 0;
		}
	
		// Reset gravity
		if !IsUnderwater
		{
			Grv = 0.21875;
		}
		else
		{
			// Lower by 0x28 (0.15625) if underwater
			Grv = 0.0625
		}
		
		// Release dropdash if charged, else reset
		if DropdashRev == 20
		{	
			// Update collision radiuses
			if RadiusY != SmallRadiusY
			{
				PosY   -= SmallRadiusY - RadiusY;
				RadiusX = SmallRadiusX;
				RadiusY = SmallRadiusY;
			}
			
			// Get dropdash force
			if SuperState
			{
				var DropForce = 12;
				var MaxForce  = 13;
			}
			else
			{
				var DropForce = 8;
				var MaxForce  = 12;
			}
		
			// Set dropspeed
			if DropdashSide == FlipRight
			{
				var Dropspeed = Inertia / 4 + DropForce * Facing;
			}
			else if DropdashSide == FlipLeft
			{
				if Angle == 360
				{
					var Dropspeed = DropForce * Facing;
				}
				else
				{
					var Dropspeed = Inertia / 2 + DropForce * Facing;
				}
			}
			Dropspeed = clamp(Dropspeed, -MaxForce, MaxForce);
			
			// Apply dropspeed to inertia
			Inertia	    = Dropspeed;
			DropdashRev = -1;
			Spinning    = true;
			Animation   = AnimSpin;
			
			// Freeze the screen for 16 frames
			if !Game.CDCamera
			{
				Camera.ScrollDelay = 16;
			}
			
			// Play sound
			audio_sfx_stop(sfxDropDash);
			audio_sfx_play(sfxRelease, false);
			
			// Shake camera if Super Sonic (values are not accurate to Mania)
			if SuperState
			{
				Camera.ShakeForce = 2;
				Camera.ShakeTime  = 8;
			}
			
			// Create dust effect
			instance_create(PosX, PosY + RadiusY, DropdashDust);
		}
		else
		{
			DropdashRev = -1;
		}
		
		// Reset vertical speed if landed on the object
		if OnObject
		{
			Ysp = 0;
		}
		
		// Reset collision radiuses if not rolling
		if !Spinning
		{
			PosY   -= DefaultRadiusY - RadiusY;
			RadiusX	= DefaultRadiusX;
			RadiusY = DefaultRadiusY; 
		}
	}
}
