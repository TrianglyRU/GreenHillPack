function StageEndTransitionProcess()
{
	// Exit if stage transition shouldn't be performed
	if !Game.StageTransitions
	{
		exit;
	}
	
	/* Lock the left boundary at certain point. This isn't needed 
	/  for the stages that were built with stage transition in mind */
	switch room
	{
		case Stage_GHZ2: var Bound = 2048; break;
		case Stage_GHZ3: var Bound = 512;  break;
		default:	     var Bound = 0;	   break;
	}
	if TargetLeftBoundary < Bound and Camera.ViewX >= Bound
	{
		TargetLeftBoundary = Bound;
	}
	
	// Wait until flag is set
	if IsFinished != 3
	{
		exit;
	}
	
	ds_list_destroy(Player.RecordedPosX);
	ds_list_destroy(Player.RecordedPosY);
	
	// Buffer and reset data
	Game.Score			 = Player.Score;
	Game.Lives			 = Player.Lives;
	Game.StarPostData    = [];
	Game.SpecialRingList = [];
	
	// Save our progress at the end of the zone
	if ActID == FinalActID
	{
		if Game.ActiveSave != -1
		{
			if ZoneID == FinalZoneID
			{
				// Mark savefile as completed if this was the last zone
				Game.SaveState = 1;
			}
			else
			{
				Game.Stage++;
			}
			gamedata_save(Game.ActiveSave);
		}
	}
	
	// Buffer camera position, player position and background autoscroll offset
	else
	{
		var Length = array_length(Background.BGValues);
		for (var i = 0; i < Length; i++)
		{
			Game.TransitionData[2][i] = Background.BGValues[i][12];
		}	
		Game.TransitionData[0] = floor(Player.PosX) - (Camera.ViewX + Game.Width / 2);
		Game.TransitionData[1] = floor(ClearPanel.y + sprite_get_height(ClearPanel.sprite_index) div 2 - Camera.ViewY);	
	}

	// Load into the next stage
	if !array_equals(Game.TransitionData, []) 
	or  array_equals(Game.TransitionData, []) and fade_check(StateMax)
	{
		if NextStage != noone
		{
			room_goto(NextStage);
		}
	}
}