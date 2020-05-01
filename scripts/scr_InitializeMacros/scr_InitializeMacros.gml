//View
#macro RESOLUTION_WIDTH 426
#macro RESOLUTION_HEIGH 240
#macro VIEW_WIDTH 1280
#macro VIEW_HEIGHT 720
#macro X_VIEW camera_get_view_x(view_camera)
#macro Y_VIEW camera_get_view_y(view_camera)
#macro X_ACTIVE_BOX camera_get_view_x(view_camera) - camera_get_view_width(view_camera)
#macro Y_ACTIVE_BOX camera_get_view_y(view_camera) - camera_get_view_height(view_camera)
#macro W_ACTIVE_BOX camera_get_view_width(view_camera) * 3
#macro H_ACTIVE_BOX camera_get_view_height(view_camera) * 3

//Gameplay
#macro DELTA_TIME myDeltaTime * global.deltaTime
#macro GRAVITY_AIR 0.3
#macro MAX_FALL_AIR 6
#macro GRAVITY_WATER 0.15
#macro MAX_FALL_WATER 3