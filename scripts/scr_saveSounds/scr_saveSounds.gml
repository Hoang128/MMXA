function scr_saveSounds() {
	ini_open("config.ini");

	ini_write_real("sounds", "volume_master", global.masterVolume);
	ini_write_real("sounds", "volume_sfx", global.SFXVolume);
	ini_write_real("sounds", "volume_bgm", global.BGMVolume);

	ini_close();


}
