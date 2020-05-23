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
	
	if (ini_section_exists("sounds"))
	{
		global.masterVolume = ini_read_real("sounds", "volume_master", 1);
		global.SFXVolume = ini_read_real("sounds", "volume_sfx", 1);
		global.BGMVolume = ini_read_real("sounds", "volume_bgm", 1);
	}
	
	if (ini_section_exists("keyboard"))
	{
		global.keyUp = ini_read_real("keyboard", "up", vk_up);
		global.keyDown = ini_read_real("keyboard", "down", vk_down);
		global.keyLeft = ini_read_real("keyboard", "left", vk_left);
		global.keyRight = ini_read_real("keyboard", "right", vk_right);
		global.keyAtk = ini_read_real("keyboard", "attack", ord("C"));
		global.keySpAtk = ini_read_real("keyboard", "special_attack", ord("V"));
		global.keyDash = ini_read_real("keyboard", "dash", ord("Z"));
		global.keyJump = ini_read_real("keyboard", "jump", ord("X"));
		global.keyGiga = ini_read_real("keyboard", "giga", vk_space);
		global.keyChar1 = ini_read_real("keyboard", "key_char_1", ord("D"));
		global.keyChar2 = ini_read_real("keyboard", "key_char_2", ord("F"));
		global.keyChangeL = ini_read_real("keyboard", "key_change_l", ord("A"));
		global.keyChangeR = ini_read_real("keyboard", "key_change_r", ord("S"));
		global.keyMap = ini_read_real("keyboard", "map", vk_tab);
	}
	
	ini_close();
	
	//Setup Sound & Graphics
	if (os_type == os_windows)
	{
		window_set_size(global.wWidth, global.wHeight);
		if (global.fullScreen == 1)	
			window_set_fullscreen(true);
		else						
		{
			window_set_fullscreen(false);
		}
	}

	audio_master_gain(global.masterVolume);
	audio_emitter_gain(global.BGM_Emitter, global.BGMVolume);
	audio_emitter_gain(global.SFX_Emitter, global.SFXVolume);
}