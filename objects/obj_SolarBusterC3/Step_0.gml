/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if ((lv2ExistTime < lv2ExistTimeMax) && (lv2ExistTime > 0))
	lv2ExistTime -= DELTA_TIME;
else if (lv2ExistTime <= 0)
{
	if (damage != 0)
		damage = 0;
	x += image_xscale;
	if (image_xscale != 0)	image_xscale -= sign(image_xscale) * 0.02;
	if (image_yscale != 0)	image_yscale -= 0.02;
	if ((image_xscale == 0) && (image_yscale == 0))
		instance_destroy();
}