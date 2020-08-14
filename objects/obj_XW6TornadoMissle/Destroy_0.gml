/// @description Insert description here
// You can write your code in this editor
ds_list_clear(targetList);
ds_list_destroy(targetList);
if (createOrb == true)
	instance_create_depth(x, y, depth - 1, obj_XW6TornadoOrb);