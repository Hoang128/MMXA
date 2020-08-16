/// @description Insert description here
// You can write your code in this editor

if (vspd < MAX_FALL_AIR)
{
	vspd += GRAVITY_AIR;
}
else	vspd = MAX_FALL_AIR;

y += vspd * DELTA_TIME;

if (place_meeting(x, y, obj_block))
{
	createEff = true;
	instance_destroy();
}

scr_destroyObjOutOfCamera(self);