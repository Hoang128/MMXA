/// @description Handle
if (!init)
{
	switch(parameter)
	{
		case 0: volume = global.masterVolume;	break;
		case 1: volume = global.SFXVolume;		break;
		case 2: volume = global.BGMVolume;		break;
	}
	valDisplay = volume * ratio;
	init = true;
}
if (!instance_exists(obj_menuSounds)) instance_destroy();
if (active)
{
	if (keyboard_check_pressed(global.keyLeft))
	{
		if (valDisplay > minVal)
		{
			audio_play_sound_on(global.SFX_Emitter, soundMove, 0, 0);
			valDisplay--;
		}
	}
	
	if (keyboard_check_pressed(global.keyRight))
	{
		if (valDisplay < maxVal)
		{
			audio_play_sound_on(global.SFX_Emitter, soundMove, 0, 0);
			valDisplay++;
		}
	}
	
	if (keyboard_check_pressed(global.keyDash))
	{
		audio_play_sound_on(global.SFX_Emitter, soundMove, 0, 0);
		active = -3;
		obj_menuSounds.lineExecute[line] = false;
		obj_menuSounds.lineHandle[line] = false;
		obj_menuSounds.active = 1;
	}
	
	if (keyboard_check_pressed(global.keyJump))
	{
		audio_play_sound_on(global.SFX_Emitter, soundConfirm, 0, 0);
		active = -3
		volume = valDisplay / ratio;
		switch(parameter)
		{
			case 0:	
			{
				audio_master_gain(volume);
				global.masterVolume = volume;
				break;
			}
			case 1: 
			{
				audio_emitter_gain(global.SFX_Emitter, volume);
				global.SFXVolume = volume;
				break;
			}
			case 2: 
			{
				audio_emitter_gain(global.BGM_Emitter, volume);
				global.BGMVolume = volume;
				break;
			}
		}
		obj_menuSounds.lineExecute[line] = false;
		obj_menuSounds.lineHandle[line] = false;
		obj_menuSounds.active = 1;
	}
}
else 
{
	if (active >= -2) active++;
}