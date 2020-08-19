/// @description Insert description here
// You can write your code in this editor

with (other)
	scr_playerBackToIdle();
	
if (triggerScene != noone)
{
	instance_create_depth(x, y, depth, triggerScene);
}

instance_destroy();