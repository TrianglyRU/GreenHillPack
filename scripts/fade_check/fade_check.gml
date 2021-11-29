/// @function fade_check(state)
function fade_check(state)
{
	// Return false if there is no palette controller for some reason
	if !instance_exists(Palette)
	{
		return false;
	}
	
	// Return check result
	switch state
	{
		case StateActive:
			return Palette.FadeStep < 756;
		break;
		case StateMax:
			return Palette.FadeStep == 0;
		break;
	}	
}