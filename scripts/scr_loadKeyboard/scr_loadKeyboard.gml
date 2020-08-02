if (file_exists("config.ini"))
{
	ini_open("config.ini");
	
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
		global.keyMap = ini_read_real("keyboard", "map", ord("D"));
		global.keyChangeL = ini_read_real("keyboard", "key_change_l", ord("A"));
		global.keyChangeR = ini_read_real("keyboard", "key_change_r", ord("S"));
		
	}
	
	ini_close();
}