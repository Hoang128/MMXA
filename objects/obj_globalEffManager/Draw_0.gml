/// @description Draw glow effect
surface_set_target(glowSurface);
draw_clear(c_black);
	
with(obj_player)
{
	if (glow == 1)
	{
		gpu_set_blendmode(bm_src_color);
		var rFirst = min(bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_color(c_white);
		draw_set_alpha(other.glowRatio1);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 1), false);
		draw_set_alpha(other.glowRatio2);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 2), false);
		draw_set_alpha(other.glowRatio3);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 3), false);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
	}
}

with (obj_PlayerWeapon)
{
	if (glow == 1)
	{
		gpu_set_blendmode(bm_src_color);
		var rFirst = min(bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_color(c_white);
		draw_set_alpha(other.glowRatio1);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 1), false);
		draw_set_alpha(other.glowRatio2);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 2), false);
		draw_set_alpha(other.glowRatio3);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 3), false);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
	}
}

with (obj_effect)
{
	if (glow == 1)
	{
		gpu_set_blendmode(bm_src_color);
		var rFirst = min(bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_color(c_white);
		draw_set_alpha(other.glowRatio1);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 1), false);
		draw_set_alpha(other.glowRatio2);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 2), false);
		draw_set_alpha(other.glowRatio3);
		draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * (1 + other.glowRadiusBonusRatio * 3), false);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
	}
}

surface_reset_target();
draw_surface_ext(glowSurface, camera_get_view_x(view_camera), camera_get_view_y(view_camera), 1, 1, 0, c_white, dark);