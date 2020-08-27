/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_destroyObjOutOfCamera(self);

switch (state)
{
	case 0:
	{
		audio_play_sound_on(global.SFX_Emitter, snd_GVSparkRun, false, false);
		state = 1;
	}	break;
	
	case 1:
	{
		motion_set(-90 * yDir, moveSpd * DELTA_TIME);
		if (place_meeting(x, y + yDir * moveSpd, obj_block))
		{
			motion_set(0, 0);
			state = 2;
		}
	}	break;
	
	case 2:
	{
		motion_set(90 - 90 * image_xscale, moveSpd * DELTA_TIME);
		if (!place_meeting(x, y + yDir * moveSpd, obj_block))
		{
			motion_set(0, 0);
			state = 1;
		}
	}	break;
}

if (place_meeting(x, y, obj_block))	instance_destroy();

