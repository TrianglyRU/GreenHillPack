function PlayerProcess()
{
	// Check if we should not process player
	if fade_check(StateActive) and !Game.DemoMode 
	{
		return false;
	}
	if DebugMode or Stage.IsPaused or Stage.Time == 0
	{
		return false;
	}
	
	// ...else process!
	return true;
}