function scr_drawSurfaceAllObject() {
	timeFSurf = surface_create(surfW, surfH);

	surface_set_target(timeFSurf);
	draw_clear_alpha(c_black, 0);

	with (self)							visible = 0;
	with (obj_player)					visible = 0;
	with (obj_armorImage)				visible = 0;
	with (obj_PlayerWeaponMeeleImage)	visible = 0;
	with (obj_PlayerWeapon)				visible = 0;
	with (obj_PlayerShadowEffect)		visible = 0;
	with (obj_ChargeEffLv1)				visible = 0;
	with (obj_ChargeEffLv2)				visible = 0;
	with (obj_ShotEffX)					visible = 0;
	with (obj_ShotEffZ)					visible = 0;
	with(all)
	{
		var xx = other.xPlace - other.surfW/2;
		var yy = other.yPlace - other.surfH/2;
		var ww = other.surfW;
		var hh = other.surfH;
		if (visible)
		{
			var xPlace = x;
			var yPlace = y;
			var xPlaceRev = xPlace - xx;
			var yPlaceRev = yPlace - yy;
			if (collision_rectangle(xx, yy, xx + ww, yy + hh, self, false, false))
			{
				{
					x = xPlaceRev;
					y = yPlaceRev;
					event_perform(ev_draw, 0);
					x = xPlace;
					y = yPlace;
				}
			}
		}
	}
	with (obj_player)					visible = 1;
	with (obj_armorImage)				visible = 1;
	with (obj_PlayerWeapon)				visible = 1;
	with (obj_PlayerWeaponMeele)		visible = 0;
	with (obj_PlayerWeaponMeeleImage)	visible = 1;
	with (obj_PlayerShadowEffect)		visible = 1;
	with (obj_ChargeEffLv1)				visible = 1;
	with (obj_ChargeEffLv2)				visible = 1;
	with (obj_ShotEffX)					visible = 1;
	with (obj_ShotEffZ)					visible = 1;
	with (self)							visible = 1;

	gpu_set_blendmode(bm_src_color);
	draw_sprite_ext(spr_XW7TimeRearImg, 0, 0, 0, 1 / 64 * radius, 1 / 64 * radius, 0, c_white, 1);
	draw_sprite_ext(spr_XW7TimeRearImg, 0, surfW, 0, 1 / 64 * radius, 1 / 64 * radius, 270, c_white, 1);
	draw_sprite_ext(spr_XW7TimeRearImg, 0, surfW, surfH, 1 / 64 * radius, 1 / 64 * radius, 180, c_white, 1);
	draw_sprite_ext(spr_XW7TimeRearImg, 0, 0, surfH, 1 / 64 * radius, 1 / 64 * radius, 90, c_white, 1);
	gpu_set_blendmode(bm_normal);

	surface_reset_target();


}
