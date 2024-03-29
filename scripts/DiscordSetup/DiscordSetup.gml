function DiscordSetup()
{
	// Remove controller if Rich Presence is disabled
	if !Game.RichPresenceSupport
	{
		instance_destroy(); 
		return;
	}
	PresenceReady = false;
	
	// Set stage data
	if !Game.IntroSequence
	{
		switch room 
		{
			case Stage_GHZ1:
			{
				DetailsString = "GREEN HILL 1";
				MainImage     = "ghz";
			}
			break;
			case Stage_GHZ2:
			{
				DetailsString = "GREEN HILL 2";
				MainImage     = "ghz";
			}
			break;
			case Stage_GHZ3:
			{
				DetailsString = "GREEN HILL 3";
				MainImage     = "ghz";
			}
			break;
			case Screen_Title:
			{
				DetailsString = "In Menus";
				MainImage     = "menu";
			}
			break;
			default:
			{
				DetailsString = "";
				MainImage     = "";
			}
			break;
		}
	}
	else
	{
		DetailsString = "";
		MainImage     = "";
	}
	MainImageDesc = "";
	
	// Set character data
	if !Game.IntroSequence and instance_exists(Player)
	{
		switch Game.Character
		{
			case CharSonic:    
				var Char = "sonic";
			break;
			case CharTails:	   
				var Char = "tails";   
			break;
			case CharKnuckles: 
				var Char = "knuckles";
			break;
			default:		  
				var Char = "?";
			break;
		}
		StateString    = "Playing as: " + string_upper(Char);
		SmallImageDesc = "";
		SmallImage     = Char;
	}
	else
	{
		StateString    = "";
		SmallImageDesc = "";
		SmallImage     = "";
	}
}