/// @description Unload source

event_inherited();

obj_view.state = CameraState.FAILURE;

if (aState == ActionState.DYING)
{
	audio_play_sound_on(global.SFX_Emitter, sndVoiceDie, 0, 0);
	audio_play_sound_on(global.SFX_Emitter, snd_PlayerDeathEff, 0, 0);
	
	//Create Death Effect
	for (var i = 0; i < 12; i++)
	{
		obj[i] = instance_create_depth(x, y, depth - 1, obj_XDeathEff);
		obj[i].direction = 360 / 12 * i + 360 / 24;
		obj[i].moveSpd = 2.5;
	}

	for (var i = 0; i < 12; i++)
	{
		obj[i] = instance_create_depth(x, y, depth - 1, obj_XDeathEff);
		obj[i].direction = 360 / 12 * i;
		obj[i].moveSpd = 1.75;
	}

	for (var i = 0; i < 12; i++)
	{
		obj[i] = instance_create_depth(x, y, depth - 1, obj_XDeathEff);
		obj[i].direction = 360 / 12 * i + 360 / 24;
		obj[i].moveSpd = 1;
	}
}

if (audio_group_is_loaded(grpXSounds))
	audio_group_unload(grpXSounds);