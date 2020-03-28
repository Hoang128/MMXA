/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (backExecute) instance_destroy();

if (lineExecute[4])
{
	if (!instance_exists(obj_menuSounds))
	{
		var obj = instance_create_depth(x + width + 16, y, depth, obj_menuSounds);
		obj.width = (1280 - obj.x - 16);
		obj.height = self. height;
	}
}