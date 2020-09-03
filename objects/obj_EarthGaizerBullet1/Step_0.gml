/// @description Insert description here
// You can write your code in this editor
if (init == false)
{
	image_angle = direction;
	init = true;
}
else
{
	motion_set(direction, moveSpd * DELTA_TIME);
	scr_destroyObjOutOfCamera(self);
}