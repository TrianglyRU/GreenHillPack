function StageSetup()
{	
	/* Set here the ID of your last zone. It will be used to mark 
	the savefile as the complete one */
	FinalZoneID = 0;
	
	// Osillate angle value. Do not edit unless really needed!
	OscillateAngle = 1.40625;
	
	switch room 
	{	
		case Stage_GHZ1:
		{
			ZoneName	     = "GREEN HILL";
			ZoneID		     = 0;
			ActID		     = 0;
			FinalActID       = 2;
			WaterEnabled     = false;
			WaterLevel	     = 0;
			StageMusic       = GreenHill;
			LeftBoundary	 = 0;
			TopBoundary	     = 0;
			RightBoundary	 = room_width;
			BottomBoundary	 = 992;
			AnimatedGraphics = [tex_ghz_anitile00, 21, tex_ghz_anitile01, 10];
			AnimalSet	     = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			NextStage		 = Stage_GHZ2;
		}
		break;
		case Stage_GHZ2:
		{
			ZoneName	     = "GREEN HILL";
			ZoneID		     = 0;
			ActID		     = 1;
			FinalActID       = 2;
			WaterEnabled     = false;
			WaterLevel	     = 0;
			StageMusic       = GreenHill;
			LeftBoundary	 = 0;
			TopBoundary	     = 0;
			RightBoundary	 = room_width;
			BottomBoundary	 = 992;
			AnimatedGraphics = [tex_ghz_anitile00, 21, tex_ghz_anitile01, 10];
			AnimalSet	     = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			NextStage		 = Stage_GHZ3;
		}
		break;
		case Stage_GHZ3:
		{
			ZoneName	     = "GREEN HILL";
			ZoneID		     = 0;
			ActID		     = 2;
			FinalActID       = 2;
			WaterEnabled     = false;
			WaterLevel	     = 0;
			StageMusic       = GreenHill;
			LeftBoundary	 = 0;
			TopBoundary	     = 0;
			RightBoundary	 = room_width;
			BottomBoundary	 = 992;
			AnimatedGraphics = [tex_ghz_anitile00, 21, tex_ghz_anitile01, 10];
			AnimalSet	     = [spr_obj_animal_flicky, spr_obj_animal_ricky];
			NextStage		 = Screen_DevMenu;
		}
		break;
		default:
		{
			ZoneName	     = "UNKNOWN";
			ZoneID		     = 0;
			ActID		     = 0;
			FinalActID       = 0;
			WaterEnabled     = false;
			WaterLevel	     = 0;
			StageMusic       = noone;
			LeftBoundary	 = 0;
			TopBoundary	     = 0;
			RightBoundary	 = room_width;
			BottomBoundary	 = room_height;
			AnimatedGraphics = noone;		// Array: [sprite1, sprite1_duration, sprite2, sprite2_duration...]	
			AnimalSet	     = noone;		// Array: [animal_sprite1, animal_sprite2...]
			NextStage		 = Screen_DevMenu;
		}
		break;
	}
}
