if (file_exists("config.ini"))
{
	ini_open("config.ini");
	
	if (os_type == os_windows)
	{
		if (ini_section_exists("window"))
		{
			global.wWidth = ini_read_real("window", "window_width", 1280);
			global.wHeight = ini_read_real("window", "window_height", 720);
			global.fullScreen = ini_read_real("window", "window_mode", 0);
		}
	}
	
	ini_close();
}