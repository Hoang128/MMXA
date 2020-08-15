/// @description Draw
if (surface_exists(timeFSurf))
{
	shader_set(shd_colorInvert);
	draw_surface(timeFSurf, ceil(xPlace - surfW/2), ceil(yPlace - surfH/2));
	shader_reset();
}
else
{
	if (phase != 4)
	{
		timeFSurf = surface_create(surfW, surfH);
		alarm[0] = 1;
	}
}

draw_set_alpha(.5);
draw_self();
draw_set_alpha(1);