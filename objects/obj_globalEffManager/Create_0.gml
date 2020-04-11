/// @description Init
timeSlowEff = false;
timeSlowCounter = 0;
timeSlowRatio = 1;

earthQuakeEff = false;
earthQuakeCounter = 0;
earthQuakeRange = 3;

glowRatio = 0.8;

glowSurface = surface_create(camera_get_view_width(view_camera), camera_get_view_height(view_camera));

myDeltaTime = 1;