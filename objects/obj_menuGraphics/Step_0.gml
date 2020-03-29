/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (backExecute)
{
	instance_destroy();
}

if (lineExecute[1] == true)
{
	if (spinner[0].active == -3)
	{
		spinner[0].active = -2;
	}
}

if (lineExecute[2] == true)
{
	if (spinner[1].active == -3)
	{
		spinner[1].active = -2;
	}
}

if (window_get_fullscreen() == false)
{
	lineEnable[2] = true;
}
else lineEnable[2] = false;