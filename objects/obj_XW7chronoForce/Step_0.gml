/// @description Insert description here
// You can write your code in this editor

if (phase == 1)
{
	if (radius < radiusMax)
		radius += rSpd * DELTA_TIME;
	else
	{
		radius = radiusMax + 1;
		phase = 2;
	}
}

if (phase == 2)
{
	if (time < timeExist)
		time ++;
	else
		phase = 3;
}

if (phase == 3)
{
	if (radius > 1)
		radius -= rSpd * DELTA_TIME;
	else
	{
		radius = 1;
		phase = 4;
		instance_destroy();
	}
}

if (instance_exists(core))
{
	xPlace = (core.bbox_right + core.bbox_left) / 2;
	yPlace = (core.bbox_top + core.bbox_bottom) / 2;
	x = xPlace;
	y = yPlace;
}

surfW = radius * 2;
surfH = radius * 2;

if (surface_exists(timeFSurf))
{
	surface_free(timeFSurf);
	scr_drawSurfaceAllObject();
}