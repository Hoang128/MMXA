/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (startTime > 0)
{
	startTime -= DELTA_TIME;
	hspd += hDecreaseSpd;
	if (hspd > 3)	hspd = 3;
	vspd -= vDecreaseSpd;
}
else
{
	hspd = 3;
	vspd = 0;
	
	if (createEff < createEffMax)
	createEff += DELTA_TIME;
	else
	{
		instance_create_depth(x - image_xscale * 4, y, depth - 1, obj_E_GVMissleFrog);
		createEff = 0;
	}
}

x += image_xscale * hspd * DELTA_TIME;
y += vspd * DELTA_TIME;

scr_destroyObjOutOfCamera(self);