/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (lineExecute[1])
{
	with(obj_gameManager)
	{
		global.xSpawmLocation = 56;
		global.ySpawmLocation = 3936;
	}
	room_goto(room_PowerPlant);
}

if (lineExecute[3])
{
	room_goto(room_option);
}

if (lineExecute[4])
{
	game_end();
}