/// @description Handle

if (!instance_exists(parent)) instance_destroy();
if (parent.lineEnable[line] == 1)	enable = 1;
else								enable = 0;
if (active)
{
	if (keyboard_check_pressed(global.keyLeft))
	{
		if (cursor > 0)
		{
			audio_play_sound_on(global.SFX_Emitter, soundMove, 0, 0);
			cursor--;
		}
	}
	
	if (keyboard_check_pressed(global.keyRight))
	{
		if (cursor < contextNumber - 1)
		{
			audio_play_sound_on(global.SFX_Emitter, soundMove, 0, 0);
			cursor++;
		}
	}
	
	if (keyboard_check_pressed(global.keyDash))
	{
		audio_play_sound_on(global.SFX_Emitter, soundMove, 0, 0);
		active = -3;
		backExecute = true;
		cursor = firstContextCursor;
		parent.lineExecute[line] = false;
		parent.lineHandle[line] = false;
		parent.active = 1;
	}
	
	if (keyboard_check_pressed(global.keyJump))
	{
		audio_play_sound_on(global.SFX_Emitter, soundConfirm, 0, 0);
		active = -3;
		confirmExecute = true;
		firstContextCursor = cursor;
		parent.lineExecute[line] = false;
		parent.lineHandle[line] = false;
		parent.active = 1;
	}
}
else 
{
	if (active >= -2) active++;
}