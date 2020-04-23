/// @description Insert description here
// You can write your code in this editor
if (canExit < 1)	canExit++;
else
{
	if (keyboard_check_pressed(vk_anykey))
		instance_destroy();
}

if (!init)
{
	if (parent != noone)
		parent.active = false;
	init = true;
}