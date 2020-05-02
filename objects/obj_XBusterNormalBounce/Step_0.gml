/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + RESOLUTION_WIDTH, Y_VIEW + RESOLUTION_HEIGH, self, false, false))
{
	instance_destroy();
}

if (init == 0)
{
	visible = 1;
	motion_set(direction, moveSpd);
	init = 1;
}