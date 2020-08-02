/// @description Handle

//Deactive all

//Active object inside zone
if (activateCount > 0)
{
	activateCount--;
}
else
{
	instance_deactivate_all(true);
	instance_activate_object(obj_managerInGame);
	instance_activate_object(obj_menu);
	instance_activate_object(obj_menuTextBox);
	instance_activate_object(obj_spinnerContext);
	instance_activate_object(obj_E_Spawmer);
	instance_activate_object(obj_dynamicBlock);
	instance_activate_object(obj_block);
	instance_activate_object(obj_effScreen);
	instance_activate_object(obj_UI);
	instance_activate_object(playerCore);
	instance_activate_region(X_ACTIVE_BOX, Y_ACTIVE_BOX, X_ACTIVE_BOX + W_ACTIVE_BOX, Y_ACTIVE_BOX + H_ACTIVE_BOX, true);
	
	activateCount = activateMaxCount;
}

//Death
if (roomTrans != -1)
{
	if (timeWaitTrans <= 0 && timeWaitTrans > -10)
	{
		instance_create_depth(x, y, 0, obj_effClosing_Black);
		timeWaitTrans = -10;
	}
	else if (timeWaitTrans > 0)
		timeWaitTrans -= global.deltaTime;
	else if (timeWaitTrans == -10)
	{
		if (obj_effClosing_Black.image_alpha == 1)
		{
			switch (roomTrans)
			{
				case noone: 
				{
					if (lives < 0)
						room_goto(room_over);
					else
						room_restart();
				}	break;
				default:	room_goto(room_over);
			}
		}
	}
}

//Gamepad
//if (gamepad_is_supported())
//{
//	if (gamepad_is_connected(0))
//	{
		
//		//Default Keypad Blind
//		global.keyStart = vk_enter;
//		global.keyBack = vk_escape;
//		global.keyUp = vk_up;
//		global.keyDown = vk_down;
//		global.keyLeft = vk_left;
//		global.keyRight = vk_right;
//		global.keyAtk = ord("C");
//		global.keySpAtk = ord("V");
//		global.keyDash = ord("Z");
//		global.keyJump = ord("X");
//		global.keyGiga = vk_space;
//		global.keyMap = ord("D");
//		global.keyChangeL = ord("A");
//		global.keyChangeR = ord("S");
//	}
//	else
//	{
//	}
//}