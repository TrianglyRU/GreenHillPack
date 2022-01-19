/// @function palette_set_colour(palType,iCol,rCol)
function palette_set_colour(palType,iCol,rCol)
{
	if Palette.ColourSet[palType] == false or !Game.UpdateAnimations
	{
		exit;
	}
	
	// Update colour
	if palType == TypePrimary
	{
		Palette.IndexType1[iCol] = rCol;
	}
	else if palType == TypeSecondary
	{
		Palette.IndexType2[iCol] = rCol;
	}
		
	// Reset swaptime
	if Palette.Duration[palType,iCol] != noone
	{
		Palette.SwapTime[palType,iCol] = Palette.Duration[palType,iCol];
	}
}