/// @description Insert description here
// You can write your code in this editor
	
	// Exit if fade is active
	if !LoadFlag and fade_check(StateActive)
	{
		exit;
	}
	else if LoadFlag
	{
		// Load into GHZ
		if fade_check(StateMax)
		{
			room_goto(Stage_GHZ1);
			
			// Clear data
			Game.Score     = 0;
			Game.Continues = 2;
			Game.Lives	   = 3;
		}
		
		// Exit the code
		exit;
	}
	
	// Change character
	if keyboard_check_pressed(ord("E"))
	{
		switch Game.Character
		{
			case CharSonic:
			{
				Game.Character = CharTails;
				audio_sfx_play(sfxVOTails, false);
			}
			break;
			case CharTails:
			{
				Game.Character = CharKnuckles;
				audio_sfx_play(sfxVOKnux, false);
			}
			break;
			case CharKnuckles:
			{
				Game.Character = CharSonic;
				audio_sfx_play(sfxVOSonic, false);
			}
			break;
		}
	}
	
	// React to START button
	if Input.StartPress
	{
		LoadFlag = true;
		fade_perform(ModeInto, BlendBlack, 1);
		
		// Stop BGM
		audio_bgm_stop(ChannelPrimary, 0.5);
	}
	
	// Update palette
	palette_handle(TypePrimary, 0, 4, 4, 1, 6);
	
	// State machine
	switch State
	{
		case 0:
		{
			// Play Title Theme
			if StateTimer == 0
			{
				audio_bgm_play(ChannelPrimary, TitleTheme);
			}
			if (++StateTimer) == 42
			{
				State	  += 1;
				StateTimer = 0;
			}
		}
		break;
		case 1:
		{
			if (++StateTimer) == 339
			{
				State	  += 1;
				StateTimer = 0;
			}
		}
		break;
	}
	
	// Move camera (scroll the background)
	if State
	{
		Camera.PosX += 2;
	}