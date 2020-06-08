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
	
	if (keyboard_check_pressed(vk_pageup))
	{
		if (!keyboard_check(ord("W")))
		{
			if (global.deltaTime + 0.1 <= 1) global.deltaTime += 0.1;
			else global.deltaTime = 0.1;
		}
		else
		{
			if (global.deltaTime + 0.01 <= 1) global.deltaTime += 0.01;
			else global.deltaTime = 0.01;
		}
	}
	
	if (keyboard_check_pressed(vk_pagedown))
	{
		if (!keyboard_check(ord("W")))
		{
			if (global.deltaTime - 0.1 >= 0.1) global.deltaTime -= 0.1;
			else global.deltaTime = 1;
		}
		else
		{
			if (global.deltaTime - 0.01 >= 0) global.deltaTime -= 0.01;
			else global.deltaTime = 1;
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
	
	if (keyboard_check_pressed(ord("S")))
	{
		if (showSoundLog == 0)
		{
			showSoundLog = 1;
		}
		
		if (showSoundLog == 1)
		{
			if (keyboard_check(ord("W")))
				showSoundLog = 0;
		}
	}
	
	if (keyboard_check_pressed(ord("E")))
	{
		if (!instance_exists(obj_changePlayer))
		{
			if (instance_exists(obj_gameManager.playerCore))
			{
				if (obj_gameManager.playerCore.sprite_index == obj_gameManager.playerCore.sprStand)
				{
					var objChange = instance_create_depth(x, obj_gameManager.playerCore.y, depth, obj_changePlayer);
					objChange.playerChangeFrom = obj_gameManager.playerCore;
					if (obj_gameManager.playerCore.object_index == obj_playerX) 
						objChange.playerChangeTo = obj_playerZ;
					if (obj_gameManager.playerCore.object_index == obj_playerZ) 
						objChange.playerChangeTo = obj_playerX;
				}
			}
		}
	}
}