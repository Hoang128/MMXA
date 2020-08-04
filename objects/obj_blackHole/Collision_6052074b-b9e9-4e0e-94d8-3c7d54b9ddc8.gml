/// @description Insert description here
// You can write your code in this editor

with (other)
{
	hspd = 0;
	vspd = 0;
	motion_add(point_direction(x, y, other.x, other.y), 8);
	damage = 0;
	
	if (distance_to_point(other.x, other.y) <= 2)
		instance_destroy();
}