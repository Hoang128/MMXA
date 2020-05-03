/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_destroyObjOutOfCamera(self);

if (place_meeting(x, y, obj_block))
{
	createBulletEff = true;
	instance_destroy();
}

hspd = moveHspd * image_xscale;
vspd = moveVspd;

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;