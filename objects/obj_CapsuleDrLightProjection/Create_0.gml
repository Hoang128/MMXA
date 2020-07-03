/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

imgSpd = 0;
image_index = 0;
image_speed = 0;

if (instance_exists(obj_gameManager.playerCore))
{
	image_xscale = sign(x - obj_gameManager.playerCore.x);
}