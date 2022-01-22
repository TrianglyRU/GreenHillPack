function PlayerTailsFlight()
{
	// Exit if not flying
	if !FlightState
	{
		exit;
	}
	
	if (FlightValue--)
	{
		// Affect vertical speed
		if Input.ABCPress
		{
			Grv = -0.125;
		}
		else if Ysp < -1
		{
			Grv = 0.03125;
		}
		Ysp = max(Ysp, -4);
		
		// Play animation
		if !IsUnderwater
		{
			Animation = AnimFly;
		}
		else
		{
			Animation = AnimSwim;
		}
		
		// Stop and play new sound
		if !FlightValue
		{
			if !IsUnderwater
			{
				audio_sfx_play(sfxTired, true);
			}
			audio_sfx_stop(sfxFlying);
		}
	}
	else
	{
		// Set lower gravity
		Grv = 0.03125;
		
		// Play animation
		if !IsUnderwater
		{
			Animation = AnimFlyTired;	
		}
		else
		{
			Animation = AnimSwimTired;
		}
	}
	
	// Cancel flight
	if Game.FlightCancel and Input.Down and Input.ABCPress
	{
		// Stop sounds
		audio_sfx_stop(sfxFlying);
		audio_sfx_stop(sfxTired);
		
		// Update collision radiuses and shift camera
		RadiusX	      = SmallRadiusX;
		RadiusY		  = SmallRadiusY;
		Camera.ViewY += DefaultRadiusX - SmallRadiusX;
		
		// Set flags
		FlightState	= false;
		Spinning	= true;
		Animation	= AnimSpin;
		
		// Reset gravity
		if !IsUnderwater
		{
			Grv	= 0.21875;
		}
		else
		{
			// Lower by 0x28 (0.15625) if underwater
			Grv = 0.0625
		}
	}	
}