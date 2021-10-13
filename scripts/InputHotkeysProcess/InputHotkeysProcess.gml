function InputHotkeysProcess()
{	
	// Exit if input device is gamepad
	if Type != "Keyboard"
	{
		exit;
	}
	
	// Exit if not in dev mode
	if !Game.DevMode
	{
		exit;
	}
		
	// Stage fresh load (F1)
	if keyboard_check_pressed(vk_f1) 
	{
		Game.StarPostData	 = [];
		Game.SpecialRingData = [];
		Game.SpecialRingList = [];
		
		audio_stop_all();
		room_restart();
	}
	
	// Stage checkpoint restart (F2)
	if keyboard_check_pressed(vk_f2)
	{
		Game.SpecialRingData = [];
		
		audio_stop_all();
		room_restart();
	}
	
	// Game restart (F3)
	if keyboard_check_pressed(vk_f3) 
	{
		game_restart();
	}

	// Low FPS mode (F4)
	if keyboard_check_pressed(vk_f4) 
	{
		if game_get_speed(gamespeed_fps) != 2
		{
			game_set_speed(2, gamespeed_fps);
		}
		else
		{
			game_set_speed(60, gamespeed_fps);
		}
	}
	
	// Turn fullscreen (F5)
	if keyboard_check_pressed(vk_f5)
	{
		window_set_fullscreen(!window_get_fullscreen());
	}
	
	// Give highspeed bonus (F6)
	if keyboard_check_pressed(vk_f6)
	{
		Player.HighspeedBonus = 1200;
		audio_bgm_play(PriorityLow, HighSpeed, 0, 0);
	}
	
	// Give invincibility (F7)
	if keyboard_check_pressed(vk_f7)
	{
		Player.InvincibleBonus = 1200;
		audio_bgm_play(PriorityLow, Invincibility, 0, 0);
	}
	
	// Give barrier (F8)
	if keyboard_check_pressed(vk_f8)
	{
		// Initialise static
		static BarrierToGive = BarrierNormal;
		
		// Spawn barrier
		if !instance_exists(Barrier)
		{
			instance_create(Player.PosX, Player.PosY, Barrier);
		}
		switch BarrierToGive
		{
			case BarrierNormal:
			{
				Player.BarrierType = BarrierFlame;
				audio_sfx_play(sfxFlameBarrier, false);
			}
			break;
			case BarrierFlame:
			{
				Player.BarrierType = BarrierThunder;
				audio_sfx_play(sfxThunderBarrier, false);
			}
			break;
			case BarrierThunder:
			{
				Player.BarrierType = BarrierWater;
				audio_sfx_play(sfxWaterBarrier, false);
			}
			break;
			case BarrierWater:
			{
				Player.BarrierType = BarrierNormal;
				audio_sfx_play(sfxBarrier, false);
			}
			break;
		}
		
		// Increment value
		BarrierToGive++
		BarrierToGive = loop_value(BarrierToGive, BarrierNormal, 5);
	}
	
	// Grant extra life (F9)
	if keyboard_check_pressed(vk_f9)
	{
		Player.Lives++;
		audio_bgm_play(PriorityHigh, ExtraLife, 0, 0);
	}
	
	// Hurt player (F10)
	if keyboard_check_pressed(vk_f10) 
	{
		player_damage(false, false, false);
	}
	
	// Kill player (F11)
	if keyboard_check_pressed(vk_f11) 
	{
		player_damage(false, false, true);
	}
	
	// Add rings (F12 hold)
	if keyboard_check(vk_f12)
	{
		Player.Rings++;
	}
}