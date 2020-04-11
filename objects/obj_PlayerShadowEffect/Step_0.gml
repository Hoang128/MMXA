/// @description Step

image_alpha -= fadeSpd * DELTA_TIME;
if (!instance_exists(core)) instance_destroy();
if (image_alpha <= 0) instance_destroy();