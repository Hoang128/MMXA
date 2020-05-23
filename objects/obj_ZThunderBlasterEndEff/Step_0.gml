/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (init == 0)
{
	hspd = image_xscale * 4;
	init = 1;
}
x += hspd * DELTA_TIME;