/// @description Insert description here
// You can write your code in this editor

if (init == false)
{
	var obj = instance_create_depth((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, depth - 1, obj_NovaStrikeEffect);
	obj.image_xscale = image_xscale;
	init = true;
}

if (instance_exists(core))
{
	if (core.sprite_index == spr_XUANovaStrike2)
	{
		x = core.x;
		y = core.y;
	}
	else instance_destroy();
}
else	instance_destroy();