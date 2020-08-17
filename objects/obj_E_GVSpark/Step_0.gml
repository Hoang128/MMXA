/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_destroyObjOutOfCamera(self);

if (init == false)
{
	audio_play_sound_on(global.SFX_Emitter, snd_GVSparkStart, false, false);
	init = true;
}
else
{
	if (place_meeting(x, y, obj_block))	instance_destroy();
	switch (phase)
	{
		case 1:
		{
			if (place_meeting(x, y + moveSpd1, obj_block))
			{
				move_contact_solid(270, 0);
				hspd = 0;
				vspd = 0;
				phase = 2;
			}
		}	break;
		
		case 2:
		{
			if (waitTime > 0)
				waitTime -= DELTA_TIME;
			else
			{
				audio_play_sound_on(global.SFX_Emitter, snd_GVSparkRun, false, false);
				
				hspd = moveSpd2 * image_xscale;
				vspd = 0;
				phase = 3;
			}
		}	break;
		
		case 3:
		{
			if (place_meeting(x, y + moveSpd2, obj_block))
				move_contact_all(270, 0);
			else
			{
				phase = 4;
				hspd = 0;
				vspd = moveSpd2;
			}
		}	break;
		
		case 4:
		{
			if (place_meeting(x, y + moveSpd2, obj_block))
			{
				move_contact_all(270, 0);
				phase = 3;
				hspd = image_xscale * moveSpd2;
				vspd = 0;
			}
		}	break;
	}
}

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;