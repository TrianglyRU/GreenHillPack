/// @function palette_handle(paletteType,id,range,last,goto,duration)
function palette_handle(paletteType,id,range,last,goto,duration)
{
	// Exit if no pallete set, if playable stage is paused or fade is active
	if Palette.ColourSet[paletteType] == false or variable_check(Stage, "IsPaused") or fade_check(StateActive)
	{
		exit;
	}
	
	// Get unique ID for this palette sequence
	var SequenceID = string(last) + "_" + string(goto);
	
	// Initialise palette sequence
	if Palette.Sequence[paletteType][id] != SequenceID
	{
		Palette.Sequence[paletteType][id] = SequenceID;
		Palette.Duration[paletteType][id] = duration;
		Palette.SwapTime[paletteType][id] = duration;
	}
	
	// Update sequence
	else if duration
	{
		if !(--Palette.SwapTime[paletteType,id])
		{
			// Update colour(-s)
			for (var i = id; i < id + range; i++)
			{
				if paletteType == TypePrimary
				{
					if (++Palette.IndexType1[i]) > last
					{
						Palette.IndexType1[i] = goto;
					}
				}
				else if paletteType == TypeSecondary
				{
					if (++Palette.IndexType2[i]) > last
					{
						Palette.IndexType2[i] = goto;
					}
				}
			}
			
			// Reset duration
			Palette.SwapTime[paletteType,id] = Palette.Duration[paletteType,id];
		}
	}
}