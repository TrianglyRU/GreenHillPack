function InputStartup()
{	
	// Initialise variables
	IgnoreInput	= 0;
	Up			= 0;
	Down		= 0;
	Left		= 0;
	Right		= 0;
	A			= 0;
	B			= 0;
	C			= 0;
	ABC			= 0;
	Start		= 0;
	Mode		= 0;
	UpPress		= 0;
	DownPress	= 0;
	LeftPress	= 0;
	RightPress	= 0;
	APress		= 0;
	BPress		= 0;
	CPress		= 0;
	ABCPress	= 0;
	StartPress  = 0;
	ModePress   = 0;
	
	// Set default input controller and deadzone for gamepad
	if gamepad_is_connected(0) or gamepad_is_connected(4)
	{
		Type = "Gamepad";
	}
	else
	{
		Type = "Keyboard";
	}
	gamepad_set_axis_deadzone(0, 0.3); gamepad_set_axis_deadzone(4, 0.3);
	
	// Initialise demo variables
	if Game.DemoMode and instance_exists(Stage)
	{
		DemoEnd = false;
		ButtonTimer = array_create(9, []);
		ButtonNumber[8] = 0;
		
		if Game.DemoMode == DemoRecord
		{
			ButtonTimer = array_create(9, [0]);
		}
		else
		{
			var NewArr, Len;
			for (var i = 0; i < 9; i++)
			{
				NewArr = [];
				Len = array_length(Game.DemoData[i]);
				array_copy(NewArr, 0, Game.DemoData[i], 0, Len);
				ButtonTimer[i] = NewArr;
				TimerLimit[i] = Len;
			}
		}
	}
}