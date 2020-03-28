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
	active = 0;
	spinner[0].active = 1;
	spinner[0].inited = 0;
}

if (lineExecute[2] == true)
{
	active = 0;
	spinner[1].active = 1;
	spinner[1].inited = 0;
}

if (lineExecute[3] == true)
{
	active = 0;
	spinner[2].active = 1;
	spinner[2].inited = 0;
}

if (active == 2) active = 1;