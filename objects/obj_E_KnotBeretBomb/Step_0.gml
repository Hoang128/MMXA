/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (place_meeting(x, y, obj_block))
{
	createBulletEff = true;
	instance_destroy();
}

if (vspd < MAX_FALL_AIR)
	vspd += GRAVITY_AIR * DELTA_TIME;
else
	vspd = MAX_FALL_AIR;
	
hspd = moveHspd * image_xscale;

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;