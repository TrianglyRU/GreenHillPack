/// @function gametweaks_save()
function gametweaks_save()
{
	var File = file_bin_open("gamedata.bin", 1);
	if  File
	{
		// Rewrite data
		file_bin_rewrite(File);
		
		file_bin_write_byte(File, Game.Character);
		file_bin_write_byte(File, Game.SpindashEnabled);
		file_bin_write_byte(File, Game.PeeloutEnabled);
		file_bin_write_byte(File, Game.DropdashEnabled);
		file_bin_write_byte(File, Game.DSpinAttackEnabled);
		file_bin_write_byte(File, Game.RolljumpControl);
		file_bin_write_byte(File, Game.FlightCancel);
		file_bin_write_byte(File, Game.GroundSpeedcap);
		file_bin_write_byte(File, Game.AirSpeedcap);
		file_bin_write_byte(File, Game.StageTransitions);
		file_bin_write_byte(File, Game.SmoothRotation);
		file_bin_write_byte(File, Game.CDCamera);
		file_bin_write_byte(File, Game.CDStageTimer);
		file_bin_write_byte(File, Game.ElementalBarriers);
		
		// Close the file
		file_bin_close(File);
	}
}