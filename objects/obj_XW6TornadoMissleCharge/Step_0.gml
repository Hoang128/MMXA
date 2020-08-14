/// @description Insert description here
// You can write your code in this editor

if (!init)
{
	dir = image_xscale;
	direction = 90 - image_xscale * 90;
	motion_set(direction, spd);
	init = true;
}
else
{	
	//Image direction
	if image_xscale == 1
	   image_angle = direction;
	else
	{
	   image_xscale = 1;
	   image_yscale = -1;
	   image_angle = - direction;
	}
	
	//Create effect
	if (createWindTime < createWindMax)
		createWindTime += DELTA_TIME;
	else
	{
		var objWind = instance_create_depth(x, y, depth + 1, obj_XW6TornadoEff);
		objWind.image_xscale = image_xscale;
		objWind.image_yscale = image_yscale;
		objWind.image_angle = image_angle;
		createWindTime = 0;
	}
	
	createWindMax = ceil(constBalance / spd);
	spd += DELTA_TIME;
	motion_add(direction, spd / 300 * DELTA_TIME);
	
	if (phase == 0)
	{
		if (phaseZeroTime > 0)
			phaseZeroTime -= DELTA_TIME;
		else
			phase = 1;
	}
	if (phase == 1)
		scr_destroyObjOutOfCamera(self);
}