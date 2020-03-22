/// @description Step

image_alpha -= fadeSpd;
if (!instance_exists(core)) instance_destroy();
if (image_alpha <= 0) instance_destroy();