function scr_InitCamera() {
	camera_set_view_size(view_camera, W_NATIVE_RESOLUTION, H_NATIVE_RESOLUTION);
	camera_set_view_target(view_camera, self);
	camera_set_view_speed(view_camera, -1, -1);
	camera_set_view_border(view_camera, 200, 100); // Optimized _:3JZ


}
