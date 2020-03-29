/// @description Handle

if (active == 1)
{
	if (keyboard_check_pressed(global.keyUp) && !(keyboard_check_pressed(global.keyDown)))
	{
		if (cursor > 1) 
		{
			var newPlace = cursor - 1;
			while (lineEnable[newPlace] == false) newPlace--;
			if (newPlace != 0)
			{
				audio_play_sound_on(global.SFXVolume, soundMove, 0, 0);
				cursor = newPlace;
			}
		}
	}
	
	if (keyboard_check_pressed(global.keyDown) && !(keyboard_check_pressed(global.keyUp)))
	{
		if (cursor < lineNumber)
		{
			var newPlace = cursor + 1;
			while (lineEnable[newPlace] == false) newPlace++;
			if (newPlace != (lineNumber + 1))
			{
				audio_play_sound_on(global.SFXVolume, soundMove, 0, 0);
				cursor = newPlace;
			}
		}
	}
	
	if (keyboard_check_pressed(global.keyJump) || keyboard_check_pressed(vk_enter))
	{
		if (lineHandle[cursor] == false)
		{
			audio_play_sound_on(global.SFXVolume, soundConfirm, 0, 0);
			lineHandle[cursor] = true;
			if (haveEndEff)
				instance_create_depth(x, y, depth, obj_effClosing_Black);
			active = false;
		}
	}
	
	if (instance_exists(parent) || (lastRoom != noone))
	{
		if (keyboard_check_pressed(global.keyDash) || keyboard_check_pressed(vk_escape))
		{
			audio_play_sound_on(global.SFXVolume, soundMove, 0, 0);
			backHandle = true;
			if (haveDesEff)
				instance_create_depth(x, y, depth, obj_effClosing_Black);
			active = false;
		}
	}
}

if (backHandle)
{
	if (backExecute == false)
	{
		if (haveDesEff)
		{
			if (obj_effClosing_Black.image_alpha == 1)
				backExecute = true;
		}
		else backExecute = true;
	}
}

for (var i = 1; i <= lineNumber; i++)
{
	if (lineHandle[i] == true)
	{
		if (lineExecute[i] == false)
		{
			if (haveEndEff)
			{
				if (obj_effClosing_Black.image_alpha == 1)
					lineExecute[i] = true;
			}
			else lineExecute[i] = true;
		}
	}
}

