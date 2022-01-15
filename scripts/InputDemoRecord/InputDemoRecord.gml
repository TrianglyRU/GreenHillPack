function InputDemoRecord()
{
	if !Game.DemoMode or !instance_exists(Stage) 
	{
		exit;
	}
	
	// Recording
	if Game.DemoMode == DemoRecord
	{
		var Inputs = [Up, Down, Left, Right, A, B, C, Mode, Start];
		for(var i = 0; i < 9; i++)
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
		
		// Stop after 30 seconds
		if Stage.Time >= 1800
		{
			DemoEnd = true;
		}	
	}
}