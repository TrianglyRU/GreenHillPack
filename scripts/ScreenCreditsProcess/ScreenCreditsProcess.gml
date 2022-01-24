function ScreenCreditsProcess()
{
	if !State
	{
		if !fade_check(StateActive) and (Input.ABCPress or Input.StartPress)
		{
			State++;
			fade_perform(ModeInto, BlendBlack, 1);
		}
	}
	else if fade_check(StateMax)
	{
		room_goto(Screen_SEGA);
	}
}