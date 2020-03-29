/// @description Handle

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
		parameter = valDisplay / ratio;
		obj_menuSounds.lineExecute[line] = false;
		obj_menuSounds.lineHandle[line] = false;
		obj_menuSounds.active = 1;
	}
}
else 
{
	if (active >= -2) active++;
}