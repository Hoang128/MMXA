/// @description Init
timeSlowEff = false;
timeSlowCounter = 0;
timeSlowRatio = 1;

earthQuakeEff = false;
earthQuakeCounter = 0;
earthQuakeRange = 3;

dark = 0.75;
glowRatio1 = 0.6;
glowRatio2 = 0.5;
glowRatio3 = 0.4;
glowRadiusBonus = 8;

glowSurface = surface_create(camera_get_view_width(view_camera), camera_get_view_height(view_camera));

myDeltaTime = 1;