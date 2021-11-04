function StageSetup()
{	
	// Define last zone id. That will be used to mark savefile as completed one
	FinalZoneID = 0;
	
	// Set osillate angle to use in objects
	OscillateAngle = 1.40625;
	
	switch room 
	{	
		// GHZ1
		case Stage_GHZ1:
		{
			ZoneName			= "GREEN HILL";
			ZoneID				= 0;
			ActID				= 0;
			FinalActID			= 2;
			CardEnabled			= true;
			WaterEnabled        = false;
			WaterLevel			= 0;
			StageMusic			= GreenHill;
			LeftBoundary		= 0;
			TopBoundary			= 0;
			RightBoundary		= room_width;
			BottomBoundary		= 992;
			AnimatedGraphics	= [tex_ghz_anitile0, 21, tex_ghz_anitile1, 10];
			AnimalSet			= [spr_obj_animal_flicky, spr_obj_animal_pocky];
			NextStage		    = Stage_GHZ2;
		}
		break;
		
		// GHZ2
		case Stage_GHZ2:
		{
			ZoneName			= "GREEN HILL";
			ZoneID				= 0;
			ActID				= 1;
			FinalActID			= 2;
			CardEnabled			= true;
			WaterEnabled        = false;
			WaterLevel			= 0;
			StageMusic			= GreenHill;
			LeftBoundary		= 0;
			TopBoundary			= 0;
			RightBoundary		= room_width;
			BottomBoundary		= 992;
			AnimatedGraphics	= [tex_ghz_anitile0, 21, tex_ghz_anitile1, 10];
			AnimalSet			= [spr_obj_animal_flicky, spr_obj_animal_pocky];
			NextStage		    = Stage_GHZ3;
		}
		break;
		
		// GHZ3
		case Stage_GHZ3:
		{
			ZoneName			= "GREEN HILL";
			ZoneID				= 0;
			ActID				= 2;
			FinalActID			= 2;
			CardEnabled			= true;
			WaterEnabled        = false;
			WaterLevel			= 0;
			StageMusic			= GreenHill;
			LeftBoundary		= 0;
			TopBoundary			= 0;
			RightBoundary		= room_width;
			BottomBoundary		= 992;
			AnimatedGraphics	= [tex_ghz_anitile0, 21, tex_ghz_anitile1, 10];
			AnimalSet			= [spr_obj_animal_flicky, spr_obj_animal_pocky];
			NextStage		    = Screen_DevMenu;
		}
		break;
		
		// Default
		default:
		{
			ZoneName	     = "UNKNOWN";
			ZoneID		     = -1;
			ActID		     = 0;
			FinalActID       = 1;
			CardEnabled	     = true;
			WaterEnabled     = false;
			WaterLevel	     = 0;
			StageMusic       = noone;
			LeftBoundary	 = 0;
			TopBoundary	     = 0;
			RightBoundary	 = room_width;
			BottomBoundary	 = room_height;
			AnimatedGraphics = noone;		// Array: [sprite1, sprite1_duration, sprite2, sprite2_duration...]	
			AnimalSet	     = noone;		// Array: [animal_sprite1, animal_sprite2...]
			NextStage		 = noone;
		}
		break;
	}
}
