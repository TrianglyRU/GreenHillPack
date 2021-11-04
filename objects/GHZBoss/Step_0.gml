/// @description Insert description here
// You can write your code in this editor
	
	if !(--StateTimer)
	{
		if HP
		{
			if State == 6
			{
				State = 5;
			}
			else 
			{
				State++;
			}
			switch State
			{
				case 1:
				{
					StateTimer = 172;
					Ysp		   = 1;
				}
				break;
				case 2:
				{
					StateTimer = 96;
					Xsp		   = -1.415; //-1; 
					Ysp		   = -0.25;
				}
				break;
				case 3:
				{
					StateTimer = 120;
					Xsp		   = 0;
					Ysp		   = 0;
				}
				break;
				case 4:
				{
					StateTimer = 128;
					Xsp		   = -0.5625; //-0.25;
				}
				break;
				case 5:
				{
					StateTimer    = 62;
					Xsp		      = 0;
					image_xscale *= -1;
				}
				break;
				case 6:
				{
					StateTimer = 64;
					Xsp		   = 2.25 * -image_xscale; //1 * -image_xscale;
				}
				break;
			}
		}
		else
		{
		}
	}
	
	// Move object
	if State > 1
	{
		OffsetY = (OffsetY + 2) mod 360;
	}
	PosX += Xsp;
	PosY += Ysp + dsin(OffsetY) / 8.14;
	
	// Update position
	x = floor(PosX);
	y = floor(PosY);