function StageEndTransitionProcess()
{
	// Exit if stage transition shouldn't be performed
	if !(Game.StageTransitions and ActID != FinalActID)
	{
		return;
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
		return;
	}
	
	ds_list_destroy(Player.RecordedPosX);
	ds_list_destroy(Player.RecordedPosY);
	
	// Buffer and reset data
	Game.Score			 = Player.Score;
	Game.Lives			 = Player.Lives;
	Game.StarPostData    = [];
	Game.SpecialRingList = [];
	
	var Length = array_length(Background.BGValues);
	for (var i = 0; i < Length; i++)
	{
		Game.TransitionData[3][i] = Background.BGValues[i][12];
	}	
	Game.TransitionData[0] = floor(Player.PosX) - (Camera.ViewX + Game.Width / 2);
	Game.TransitionData[1] = floor(ClearPanel.y + sprite_get_height(ClearPanel.sprite_index) div 2 - Camera.ViewY);	
	Game.TransitionData[2] = Player.BarrierType;

	// Load into the next stage
	if NextStage != noone
	{
		room_goto(NextStage);
	}
}