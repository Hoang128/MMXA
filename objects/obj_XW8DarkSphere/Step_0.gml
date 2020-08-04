/// @description Insert description here
// You can write your code in this editor
if (instance_exists(core))
{
	xCenter = (core.bbox_right + core.bbox_left) / 2;
	yCenter = (core.bbox_top + core.bbox_bottom) / 2;
	
	if (distance < maxDistance)
		distance+= distanceSpd * DELTA_TIME;

	angle -= rotAngle*image_xscale * DELTA_TIME;
	x = lengthdir_x(distance, angle) + xCenter;
	y = lengthdir_y(distance, angle) + yCenter;

	switch (phase)
	{
		case 0:
		{
			if (image_xscale < 1)
				image_xscale += sizeSpd * DELTA_TIME;
			if (image_yscale < 1)
				image_yscale += sizeSpd * DELTA_TIME;
			if (image_xscale == 1 && image_yscale == 1)
				phase = 1;
		}	break;
	
		case 1:
		{
			if (time < existTime)	time += DELTA_TIME;
			else phase = 2;
		}	break;
	
		case 2:
		{
			if (image_xscale > 0)
				image_xscale -= sizeSpd * DELTA_TIME;
			if (image_yscale > 0)
				image_yscale -= sizeSpd * DELTA_TIME;
			if (image_xscale == 0 && image_yscale == 0)
				instance_destroy();
		}	break;
	}
}	else instance_destroy();