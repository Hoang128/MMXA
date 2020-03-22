/// @description Insert description here

//Debug key:
if (keyboard_check(ord("Q")))
{
	if (keyboard_check_pressed(vk_add))
	{
		if (!keyboard_check(ord("W")))
		{
			if (room_speed + 10 <= 60) room_speed += 10;
			else room_speed = 10;
		}
		else
		{
			if (room_speed + 1 <= 60) room_speed ++;
			else room_speed = 1;
		}
	}
	
	if (keyboard_check_pressed(vk_subtract))
	{
		if (!keyboard_check(ord("W")))
		{
			if (room_speed - 10 >= 10) room_speed -= 10;
			else room_speed = 60;
		}
		else
		{
			if (room_speed - 1 >= 0) room_speed --;
			else room_speed = 60;
		}
	}
	
	if (keyboard_check_pressed(ord("R")))
		room_restart();
	
	if (keyboard_check_pressed(ord("H")))
	{
		if (showDebugHelp == 0)
		{
			showDebugHelp = 1;
		}
		
		if (showDebugHelp == 1)
		{
			if (keyboard_check(ord("W")))
				showDebugHelp = 0;
		}
	}
	
	if (keyboard_check_pressed(ord("P")))
	{
		if (showPlayerLog == 0)
		{
			showPlayerLog = 1;
		}
		
		if (showPlayerLog == 1)
		{
			if (keyboard_check(ord("W")))
				showPlayerLog = 0;
		}
	}
}