/// @description Insert description here
// You can write your code in this editor
event_inherited();

scr_destroyObjOutOfCamera(self);

if (init == 0)
{
	visible = 1;
	init = 1;
}
motion_set(direction, moveSpd * DELTA_TIME);