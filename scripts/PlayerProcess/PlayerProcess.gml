function PlayerProcess()
{
	// Check if we should not process player
	if DebugMode or Stage.IsPaused
	{
		return false;
	}
	if fade_check(StateActive) and !Game.DemoMode
	{
		return false;
	}
	
	// ...else process!
	return true;
}