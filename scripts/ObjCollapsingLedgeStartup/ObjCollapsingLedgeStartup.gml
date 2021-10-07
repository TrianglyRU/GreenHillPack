function ObjCollapsingLedgeStartup()
{
	/* Variable Definitions	
	1. LedgeSprite,    default = spr_obj_collapsingledge_template
	2. XRadius,        default = 48
	3. YRadius,        default = 44
	4. CollisionArray, default = [64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,65,65,65,65,66,66,66,66,67,67,67,67,68,68,68,68,69,69,69,69,70,70,70,70,71,71,71,71,72,72,72,72,73,73,73,73,74,74,74,74,75,75,75,75,76,76,76,76,77,77,77,77,78,78,78,78,79,79,79,79,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80,80]
	*/
	
	// Set variables
	LeftX     = floor(x - XRadius);
	TopY      = floor(y - YRadius);
	Width     = ceil(abs(sprite_get_width(LedgeSprite))  / 16) * 16;
	Height    = ceil(abs(sprite_get_height(LedgeSprite)) / 16) * 16;
	Side      = sprite_get_width(LedgeSprite) >= 0 ? 1 : -1;
	TimeDelay = 7;
	State     = 0;
	
	// Set object solidbox
	object_set_solidbox(XRadius, YRadius, CollisionArray);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Set object unload type
	object_set_unload(TypePause);
}