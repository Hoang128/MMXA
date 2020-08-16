/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (image_index > 3)
{
	if (createFlameObj == false)
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			var obj = instance_create_depth(x + image_xscale * 32, y, depth + 1, obj_ZFlame);
			obj.image_xscale = image_xscale;
		}
		else
		{
			var obj = instance_create_depth(x + image_xscale * 32, y - 12, depth + 1, obj_ZFlameAir);
			obj.image_xscale = image_xscale;
		}
		createFlameObj = true;
	}
}