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
	
	if (keyboard_check_pressed(global.keyJump) || keyboard_check_pressed(vk_enter))
	{
		if (lineHandle[cursor] == false)
		{
			lineHandle[cursor] = true;
			if (haveEndEff)
				instance_create_depth(x, y, depth, obj_effClosing_Black);
			active = false;
		}
	}
}

for (var i = 1; i <= lineNumber; i++)
{
	if (lineHandle[i] == true)
	{
		if (haveEndEff)
		{
			if (obj_effClosing_Black.image_alpha == 1)
				lineExecute[i] = true;
		}
		else lineExecute[i] = true;
	}
}

