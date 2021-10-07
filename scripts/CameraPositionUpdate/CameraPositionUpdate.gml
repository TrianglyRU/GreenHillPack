function CameraPositionUpdate() 
{	
	// Exit if camera is disabled
	if !Enabled
	{
		exit;
	}
	
	// Calculate final view position
	if instance_exists(Stage)
	{
		ViewX = clamp(PosX + ExtendedOffset + ShakeOffset,              Stage.LeftBoundary, Stage.RightBoundary  - Game.Width);
		ViewY = clamp(PosY - SpinOffset + OverviewOffset + ShakeOffset, Stage.TopBoundary,  Stage.BottomBoundary - Game.Height);
	}
	else
	{
		ViewX = clamp(PosX + ShakeOffset, 0, room_width  - Game.Width);
		ViewY = clamp(PosY + ShakeOffset, 0, room_height - Game.Height);
	}
	
	// Update camera position
	camera_set_view_pos(GameCamera, ViewX, ViewY);
}