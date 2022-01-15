function ObjStarPostPortalEvent()
{
	// Exit if in state 0
	if !State
	{
		exit;
	}
	
	// Check if screen is full black
	if fade_check(StateMax)
	{
		// Exit demo mode
		if Game.DemoMode
		{
			Input.DemoEnd = true; exit;
		}
		
		// Remember ring amount and barrier
		Game.BonusStageData[0] = Player.Rings;
		Game.BonusStageData[1] = Player.BarrierType;
		
		// Send player to the Bonus Stage
		room_goto(BStage_Template);			
	}	
}