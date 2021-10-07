function InputGamepadProcess() 
{
	// Exit if gamepad isn't connected
	if !gamepad_is_connected(0)
	{
		exit;
	}
	
	// Exit if we ignore input or keyboard input is active
	if IgnoreInput or Type != "Gamepad"
	{
		exit;
	}

	// Get stick data
	var LVAxisValue = gamepad_axis_value(0, gp_axislv);
	var LHAxisValue = gamepad_axis_value(0, gp_axislh);
	
	// Process single press
	UpPress    = (LVAxisValue < 0 and !Up)    or gamepad_button_check_pressed(0, gp_padu);
	DownPress  = (LVAxisValue > 0 and !Down)  or gamepad_button_check_pressed(0, gp_padd);
	LeftPress  = (LHAxisValue < 0 and !Left)  or gamepad_button_check_pressed(0, gp_padl);
	RightPress = (LHAxisValue > 0 and !Right) or gamepad_button_check_pressed(0, gp_padr);
	APress     = gamepad_button_check_pressed(0, gp_face1);
	BPress     = gamepad_button_check_pressed(0, gp_face2);
	CPress     = gamepad_button_check_pressed(0, gp_face3);
	ModePress  = gamepad_button_check_pressed(0, gp_select);
	StartPress = gamepad_button_check_pressed(0, gp_start);
	ABCPress   = APress or BPress or CPress;
	
	// Process hold
	Up	  = LVAxisValue < 0 or gamepad_button_check(0, gp_padu);
	Down  = LVAxisValue > 0 or gamepad_button_check(0, gp_padd);
	Left  = LHAxisValue < 0 or gamepad_button_check(0, gp_padl);
	Right = LHAxisValue > 0 or gamepad_button_check(0, gp_padr);
	A     = gamepad_button_check(0, gp_face1);
	B     = gamepad_button_check(0, gp_face2);
	C	  = gamepad_button_check(0, gp_face3);
	Mode  = gamepad_button_check(0, gp_select);
	Start = gamepad_button_check(0, gp_start);
	ABC   = A or B or C;
	
	// Ignore double input
	if Left and Right
	{
		Left  = false;
		Right = false;
	}
	if Up and Down
	{
		Up   = false;
		Down = false;
	}
}