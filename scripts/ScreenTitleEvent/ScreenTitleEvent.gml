function ScreenTitleEvent()
{
	// Exit the code
	if LoadFlag == TitleLoad.loadNone
	{
		exit;
	}
	if fade_check(StateMax) and !audio_sfx_is_playing(CharSound)
	{
		switch LoadFlag
		{
			case TitleLoad.loadStage:
			{
				room_goto(Stage_GHZ1);
			}
			break;
			case TitleLoad.loadDemo:
			{
			}
			break;
			case TitleLoad.loadEnd:
			{
				game_end();
			}
			break;
		}
	}
}