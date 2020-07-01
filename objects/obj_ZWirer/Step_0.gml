/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	if ((core.hspd != 0) || (core.vspd != 0))
	{
		visible = 1;
	}
	else
		visible = 0;
}