/// @description Back to previous menu if possible

if ((parent != noone) && (instance_exists(parent)))
	parent.active = 1;