/// @description Handle

if (phase == 0)
{
	if (timeShot > 0) 
	{
		timeShot -= myDeltaTime * global.deltaTime;
		
		x += image_xscale * moveSpd * myDeltaTime * global.deltaTime;
		if ((distance_to_object(obj_E_RealEnemy) < radius) || (distance_to_object(obj_E_Shield) < radius)) 
			phase = 1;
	}
	else
	{
		phase = 1;
	}
}

if (phase == 1)
{
	if (imgSpd == 0) imgSpd = 0.5;
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
		sprite_index = spr_ZChronoEnd;
		image_index = 0;
	}
}

if (phase == 3)
{
	if (radius > 0) radius -= myDeltaTime * global.deltaTime * increaseRadiusSpd;
}