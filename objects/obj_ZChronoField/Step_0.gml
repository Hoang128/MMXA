/// @description Handle

if (phase == 0)
{
	if (timeShot > 0) 
	{
		timeShot -= myDeltaTime * global.deltaTime;
		
		x += image_xscale * moveSpd * myDeltaTime * global.deltaTime;
		if (distance_to_object(obj_E_Root) < radius) phase = 1;
	}
	else
	{
		phase = 1;
	}
}

if (phase == 1)
{
	if (radius < maxRadius) radius += myDeltaTime * global.deltaTime * increaseRadiusSpd;
	else phase = 2;
}

if (phase == 2)
{
	if (timeEffect > 0)
	{
		timeEffect -= myDeltaTime * global.deltaTime;
	}
	else
	{
		phase = 3;
	}
}

if (phase == 3)
{
	if (radius > 0) radius -= myDeltaTime * global.deltaTime * increaseRadiusSpd;
	else instance_destroy();
}