if (file_exists("config.ini"))
{
	ini_open("config.ini");
	
	if (ini_section_exists("sounds"))
	{
		global.masterVolume = ini_read_real("sounds", "volume_master", 1);
		global.SFXVolume = ini_read_real("sounds", "volume_sfx", 1);
		global.BGMVolume = ini_read_real("sounds", "volume_bgm", 1);
	}
	
	ini_close();
}