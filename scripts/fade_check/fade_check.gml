/// @function fade_check(fadeState)
function fade_check(fadeState)
{
	// Return check result
	switch fadeState
	{
		case StateActive:
			return Palette.FadeStep < 756;
		break;
		case StateMax:
			return Palette.FadeStep == 0;
		break;
	}	
}