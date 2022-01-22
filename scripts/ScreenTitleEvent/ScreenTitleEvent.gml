function ScreenTitleEvent()
{
	// Exit the code
	if LoadFlag == TitleLoad.loadNone
	{
		exit;
	}
	if fade_check(StateMax)
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
				switch Game.DemoQueue
				{
					case 0:
					{
						Game.Character  = CharSonic; 
						Game.DemoQueue += 1;
						
						// Load GHZ1
						demodata_load(Game.Width < 400 ? "demo_ghz1_s" : "demo_ghz1"); 
						room_goto(Stage_GHZ1);
					}
					break;
					case 1:
					{
						Game.Character  = CharTails; 
						Game.DemoQueue += 1;
						
						// Load GHZ2
						demodata_load("demo_ghz2"); room_goto(Stage_GHZ2);
					}
					break;
					case 2:
					{
						Game.Character  = CharKnuckles; 
						Game.DemoQueue -= 2;
						
						// Load GHZ3
						demodata_load("demo_ghz3"); room_goto(Stage_GHZ3);
					}
					break;
				}
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