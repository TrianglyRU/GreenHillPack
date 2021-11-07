function ObjBossTriggerMain()
{
	// Set right boundary if object exist
	Stage.TargetRightBoundary = x + max(Game.Width / 2, ArenaWidth / 2);
	
	// Check if player ran past the trigger
	if Stage.IsBossfight == -1
	{
		if object_check_overlap(Triggerbox)
		{
			// Stop music and play boss theme
			audio_bgm_stop(PriorityLow, 1);
			
			// Set new top boundary
			if ArenaHeight != -1
			{
				Stage.TargetTopBoundary = Stage.BottomBoundary - ArenaHeight;
			}
			
			// Spawn boss
			switch room
			{
				case Stage_GHZ3:
					instance_create(x + 96 + 40, y - 206, GHZBoss);
				break;
				default: break;
			}
			Stage.IsBossfight = true;
		}
	}
	
	// Check if boss is active
	else if Stage.IsBossfight == true
	{
		if !BossDefeated
		{
			// Check for a key to be pressed if it is example bossfight
			if Template and keyboard_check_pressed(ord("K"))
			{
				BossDefeated = true;
			}
			
			// Set new left boundary
			Stage.TargetLeftBoundary = x - max(Game.Width / 2, ArenaWidth / 2);
			
			// Play boss music
			if !audio_bgm_is_playing(PriorityLow)
			{
				audio_bgm_play(PriorityLow, Boss, other, other); 
			}		
		}
		else
		{
			// Scroll right boundary
			Stage.TargetRightBoundary = room_width;
			
			// Give 1000 points and cancel bossfight state
			Player.Score     += 1000;
			Stage.IsBossfight = false;
			
			// Play stage music
			audio_bgm_play(PriorityLow, Stage.StageMusic, other, other);
			
			// Destroy object
			instance_destroy();
		}
	}
}