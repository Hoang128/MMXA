/// @description Draw glow effect
surface_set_target(glowSurface);
draw_clear(c_black);
	
with(obj_player)
{
	if (glow == 1)
	{
		scr_drawGlowEff();
	}
}

with (obj_PlayerWeapon)
{
	if (glow == 1)
	{
		scr_drawGlowEff();
	}
}

with (obj_effect)
{
	if (glow == 1)
	{
		scr_drawGlowEff();
	}
}

surface_reset_target();
draw_surface_ext(glowSurface, camera_get_view_x(view_camera), camera_get_view_y(view_camera), 1, 1, 0, c_white, dark);