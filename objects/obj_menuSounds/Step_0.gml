/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (backHandle)
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

if (lineExecute[3] == true)
{
	if (spinner[2].active == -3)
	{
		spinner[2].active = -2;
	}
}