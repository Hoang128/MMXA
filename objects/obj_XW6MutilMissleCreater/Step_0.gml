/// @description Insert description here
// You can write your code in this editor
if init == false
{
	var obj0 = instance_create_depth(x, y, depth - 1, obj_XW6TornadoMissle);
	obj0.firstDir = 20;
	obj0.image_xscale = image_xscale;

	var obj1 = instance_create_depth(x, y, depth - 1, obj_XW6TornadoMissle);
	obj1.firstDir = -20;
	obj1.image_xscale = image_xscale;
	
	init = true;
}
else
	instance_destroy();