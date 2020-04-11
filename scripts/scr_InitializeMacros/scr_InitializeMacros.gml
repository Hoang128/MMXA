#macro RESOLUTION_WIDTH "426"
#macro RESOLUTION_HEIGH "240"
#macro X_ACTIVE_BOX camera_get_view_x(view_camera[0]) - camera_get_view_width(view_camera[0])
#macro Y_ACTIVE_BOX camera_get_view_y(view_camera[0]) - camera_get_view_height(view_camera[0])
#macro W_ACTIVE_BOX camera_get_view_width(view_camera[0]) * 3
#macro H_ACTIVE_BOX camera_get_view_height(view_camera[0]) * 3
#macro DELTA_TIME myDeltaTime * global.deltaTime