/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (lineExecute[1])
{
	with(obj_gameManager)
	{
		global.xSpawmLocation = x;
		global.ySpawmLocation = y;
	}
	room_goto(room_test);
}

if (lineExecute[3])
{
	room_goto(room_option);
}

if (lineExecute[4])
{
	game_end();
}