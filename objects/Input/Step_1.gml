/// @description Pre-Objects Code
// You can call your scripts in this editor
	
	// Update Input
	InputUpdate();
	
	// Pre-Objects Scripts
	if !InputDemoPlayback()
	{
		InputGamepadProcess();
		InputKeyboardProcess();
		InputReset();
	}
	InputDemoRecord();
	InputDemoEnd();
	InputHotkeysProcess();