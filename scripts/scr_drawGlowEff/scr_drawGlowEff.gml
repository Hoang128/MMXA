function scr_drawGlowEff(argument0, argument1) {
	var drawAlphaRatio = argument0;
	var drawRadiusRatio = argument1;
	gpu_set_blendmode(bm_src_color);
	var rFirst = min((bbox_right - bbox_left) / 2 * 1.8, (bbox_bottom - bbox_top) / 2 * 1.8);
	draw_set_color(c_white);
	draw_set_alpha(other.glowRatio1 * drawAlphaRatio);
	draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * drawRadiusRatio + other.glowRadiusBonus * 1 * drawRadiusRatio, false);
	draw_set_alpha(other.glowRatio2 * drawAlphaRatio);
	draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * drawRadiusRatio + other.glowRadiusBonus * 2 * drawRadiusRatio, false);
	draw_set_alpha(other.glowRatio3 * drawAlphaRatio);
	draw_circle((bbox_left + bbox_right) / 2 - camera_get_view_x(view_camera), (bbox_top + bbox_bottom) / 2 - camera_get_view_y(view_camera),  rFirst * drawRadiusRatio + other.glowRadiusBonus * 3 * drawRadiusRatio, false);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);


}
