/// @description Handle

if (!init)
{
	lineHandle[lineNumber + 1] = false;
	lineExecute[lineNumber + 1] = false;
	lineEnable[lineNumber + 1] = true;
	lineChild[lineNumber + 1] = noone;
	for(var i=0; i <= lineNumber; i++)
	{
		if (lineEnable[i] != false)
			lineEnable[i] = true;
		lineHandle[i] = false;
		lineExecute[i] = false;
		if (lineChild[i] != noone)
			continue;
		else
			lineChild[i] = noone;
	}
	
	init++;
}

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
	
	if (instance_exists(parent))
	{
		if (keyboard_check_pressed(global.keyDash) || keyboard_check_pressed(vk_escape))
		{
			instance_destroy(self);
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

