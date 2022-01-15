function StageEndProcess()
{
	// Check if we should exit
	if !(IsFinished and fade_check(StateMax))
	{
		exit;
	}
	
	ds_list_destroy(Player.RecordedPosX);
	ds_list_destroy(Player.RecordedPosY);
	
	// Exit demo mode
	if Game.DemoMode
	{
		Input.DemoEnd = true; exit;
	}
	
	// Buffer and reset data
	Game.Score			 = Player.Score;
	Game.Lives			 = Player.Lives;
	Game.StarPostData    = [];
	Game.SpecialRingList = [];
		
	// Check if this is the final act of the zone
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
		
		// Save our progress
		gamedata_save(Game.ActiveSave);
	}

	// Load into the next stage
	if NextStage != noone
	{
		room_goto(NextStage);
	}
}