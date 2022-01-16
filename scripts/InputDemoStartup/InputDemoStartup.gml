function InputDemoStartup()
{
	// Initialise demo mode system if has been triggered
	if Game.DemoMode and instance_exists(Stage)
	{
		ButtonTimer     = array_create(9, []);
		ButtonNumber[8] = 0;
		
		if Game.DemoMode == DemoRecord
		{
			ButtonTimer = array_create(9, [0]);
		}
		else for (var i = 0; i < 9; i++)
		{
			var NewArray = [];
			var Length   = array_length(Game.DemoData[i]);
				
			array_copy(NewArray, 0, Game.DemoData[i], 0, Length);
				
			ButtonTimer[i] = NewArray;
			TimerLimit[i]  = Length;
		}
	}
}