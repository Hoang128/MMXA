scr_loadGraphics();
scr_loadSounds();
scr_loadKeyboard();

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