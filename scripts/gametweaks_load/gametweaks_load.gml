/// @function gametweaks_load()
function gametweaks_load()
{
	if file_exists("gamedata.bin") //and !Game.DevMode
	{
		// Open the file
		var File = file_bin_open("gamedata.bin", 0);
		
		Game.Character			= file_bin_read_byte(File);
		Game.SpindashEnabled	= file_bin_read_byte(File);
		Game.PeeloutEnabled		= file_bin_read_byte(File);
		Game.DropdashEnabled	= file_bin_read_byte(File);
		Game.DSpinAttackEnabled = file_bin_read_byte(File);
		Game.RolljumpControl	= file_bin_read_byte(File);
		Game.FlightCancel		= file_bin_read_byte(File);
		Game.GroundSpeedcap		= file_bin_read_byte(File);
		Game.AirSpeedcap		= file_bin_read_byte(File);
		Game.StageTransitions	= file_bin_read_byte(File);
		Game.SmoothRotation		= file_bin_read_byte(File);
		Game.CDCamera			= file_bin_read_byte(File);
		Game.CDStageTimer		= file_bin_read_byte(File);
		Game.ElementalBarriers	= file_bin_read_byte(File);
		
		file_bin_close(File);
	}
}