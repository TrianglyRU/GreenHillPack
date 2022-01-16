function InputDemoRecord()
{
	// Exit if not in recording
	if Game.DemoMode != DemoRecord or !instance_exists(Stage) 
	{
		exit;
	}
	
	// Record input
	var Inputs = [Up, Down, Left, Right, A, B, C, Mode, Start];
	for (var i = 0; i < 9; i++)
	{
		if ButtonNumber[i] mod 2 != Inputs[i]
		{
			ButtonNumber[i]++;
			ButtonTimer[i][ButtonNumber[i]] = 0;
		}
		else
		{
			ButtonTimer[i][ButtonNumber[i]]++;
		}
	}
		
	// Stop recording
	if Stage.Time >= 1800 or Input.StartPress
	{
		DemoEnd = true;
	}	
}