function ObjSpecialRingEvent()
{
	// Teleport player to special stage
	if State == 2 and fade_check(FadeMax)
	{
		room_goto(Screen_SStage);
	}
}