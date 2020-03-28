/// @description Handle

if (active)
{
	if (keyboard_check_pressed(global.keyUp) && !(keyboard_check_pressed(global.keyDown)))
	{
		if (cursor > 1) 
		{
			audio_play_sound_on(global.SFX_Emitter, snd_ElectricWind, 0, 0);
			cursor--;
		}
	}
	
	if (keyboard_check_pressed(global.keyDown) && !(keyboard_check_pressed(global.keyUp)))
	{
		if (cursor < lineNumber)
		{
			audio_play_sound_on(global.SFX_Emitter, snd_ElectricWind, 0, 0);
			cursor++;
		}
	}
}