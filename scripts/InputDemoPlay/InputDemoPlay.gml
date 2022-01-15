function InputDemoPlay()
{
	if Game.DemoMode != DemoPlay or !instance_exists(Stage) 
	{
		return false;
	}
	
	var Inputs; Inputs[8] = 0;
			
	for (var i = 0; i < 9; i++)
	{
		if ButtonNumber[i] < TimerLimit[i] 
		{
			if ButtonTimer[i][ButtonNumber[i]]
			{
				Inputs[i] = ButtonNumber[i] mod 2;
				ButtonTimer[i][ButtonNumber[i]]--;
			}
			else
			{
				Inputs[i] = !(ButtonNumber[i] mod 2);
				ButtonNumber[i]++;
			}
		}
	}
			
	// Key Press
	UpPress    = Inputs[0] and !Up;
	DownPress  = Inputs[1] and !Down;
	LeftPress  = Inputs[2] and !Left;
	RightPress = Inputs[3] and !Right;
	APress     = Inputs[4] and !A;
	BPress     = Inputs[5] and !B;
	CPress     = Inputs[6] and !C;	
	ModePress  = Inputs[7] and !Mode;
	StartPress = Inputs[8] and !Start;	
	ABCPress   = APress or BPress or CPress;
		
	// Key Down
	Up    = Inputs[0];
	Down  = Inputs[1];
	Left  = Inputs[2];
	Right = Inputs[3];
	A     = Inputs[4];
	B     = Inputs[5];
	C     = Inputs[6];
	Mode  = Inputs[7];
	Start = Inputs[8];
	ABC   = A or B or C;
	
	// Stop playback
	if !DemoEnd
	{
		if Stage.Time >= 1800
		{
			DemoEnd = true;
		}	
		else switch Type
		{
			case "Keyboard": 
			{
				// Get keyboard mappings
				var Key = Game.KeyboardControl;
						
				var j = 0;
				while j < 9
				{
					if keyboard_check_pressed(Key[j])
					{
						DemoEnd = true; 
					}
					j++;
				}
			}
			break;
			case "Gamepad":
			{
				// Key Press
				if gamepad_button_check_pressed(0, gp_padu)
				or gamepad_button_check_pressed(0, gp_padd)
				or gamepad_button_check_pressed(0, gp_padl)
				or gamepad_button_check_pressed(0, gp_padr)
				or gamepad_axis_value(0, gp_axislv) != 0
				or gamepad_axis_value(0, gp_axislh) != 0
				or gamepad_button_check_pressed(0, gp_face1)
				or gamepad_button_check_pressed(0, gp_face2)
				or gamepad_button_check_pressed(0, gp_face3)
				or gamepad_button_check_pressed(0, gp_select)
				or gamepad_button_check_pressed(0, gp_start)
				{
					DemoEnd = true;
				}
			}
			break;
		}
	}
	return true;
}