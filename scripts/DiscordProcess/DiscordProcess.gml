function DiscordProcess()
{
	if !PresenceReady and Game.DiscordEvent == "DiscordReady"
	{	
		np_clearpresence();
		np_setpresence(StateString, DetailsString, MainImage, SmallImage);	
		np_setpresence_more(SmallImageDesc, MainImageDesc, false);
		np_setpresence_timestamps(Game.DiscordTime, 0, false);
		
		// Set flag
		PresenceReady = true;
	}
	
	// Call async event
	np_update();
}