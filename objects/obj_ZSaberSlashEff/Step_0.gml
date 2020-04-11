/// @description Insert description here
// You can write your code in this editor

image_alpha -= fadeSpd;
if (image_xscale < xScaleMax)
	image_xscale += xScaleMax / 10;

if (image_alpha <= 0)
	instance_destroy();