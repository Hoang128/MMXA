/// @description Handle

//System key
#region

if (keyboard_check_pressed(vk_f4))
{
	if (window_get_fullscreen() == false)
	{
		if (canSetFullScreen)	
		{
			window_set_fullscreen(true);
			canSetFullScreen = false;
		}
	}
	else
	{
		if (canSetFullScreen)
		{
			window_set_fullscreen(false);
			canSetFullScreen = false;
		}
	}
}
if (keyboard_check_released(vk_f4))
{
	if (!canSetFullScreen)
		canSetFullScreen = true;
}

if (keyboard_check_pressed(vk_f5))
{
	if (window_get_height() == 720)
	{
		if (canChangeViewPort)	
		{
			window_set_rectangle(window_get_x(), window_get_y(),640, 360);
			canChangeViewPort = false;
		}
	}
	else
	{
		if (canChangeViewPort)
		{
			window_set_rectangle(window_get_x(), window_get_y(),1280, 720);
			canChangeViewPort = false;
		}
	}
}
if (keyboard_check_released(vk_f5))
{
	if (!canChangeViewPort)
		canChangeViewPort = true;
}

#endregion


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
				case noone: room_restart();		break;
				default:	room_restart();
			}
		}
	}
}