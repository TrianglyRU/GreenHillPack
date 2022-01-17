function StageEndRegularProcess()
{
	// Exit if stage transition should be performed
	if Game.StageTransitions
	{
		exit;
	}
	
	// Wait until we fade out
	if !(IsFinished > 1 and fade_check(StateMax))
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
	if ActID == FinalActID and Game.ActiveSave != -1
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

	// Load into the next stage
	if NextStage != noone
	{
		room_goto(NextStage);
	}
}