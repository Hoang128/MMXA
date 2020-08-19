/// @description Insert description here
// You can write your code in this editor

scr_destroyObjOutOfCamera(self);

if (init == true)
{
	xCenter= x-image_xscale*16;
	yCenter = y;
	angle = 90-image_xscale*90;
	init = false;
}
else
{
	if (image_angle < 360)
		image_angle +=rotAngleSelf * image_xscale * DELTA_TIME;
	else
		image_angle = 0;

	angle -= rotAngle*image_xscale * DELTA_TIME;
	x = lengthdir_x(distance, angle) + xCenter;
	y = lengthdir_y(distance, angle) + yCenter;

	switch (phase)
	{
		case 0:
		{
			if (image_index > 3)
				phase = 1;
		}	break;
		case 2:
		{
			if (image_index < 1)
				instance_destroy();
		}	break;
	}
}