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
		RoomEnd = true;
	}
	
	// Stage checkpoint restart (F2)
	if keyboard_check_pressed(vk_f2)
	{
		Game.SpecialRingData = [];
		
		audio_stop_all();
		room_restart();
		RoomEnd = true;
	}
	
	// Game restart (F3)
	if keyboard_check_pressed(vk_f3) 
	{
		game_restart();
		RoomEnd = true;
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
		audio_bgm_play(PriorityLow, Invincibility, other, other);
	}
	
	// Give or update barrier (F8)
	if keyboard_check_pressed(vk_f8)
	{
		// Create barrier if it doesn't exist
		if !instance_exists(Barrier)
		{
			Player.BarrierType = BarrierNormal;
			audio_sfx_play(sfxBarrier, false);
			
			instance_create(Player.PosX, Player.PosY, Barrier);
		}
		
		// Update its type
		else switch Player.BarrierType
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