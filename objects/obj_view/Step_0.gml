/// @description Change elem in real-time
playerCore = obj_gameManager.playerCore;

if (instance_exists(playerCore))
{	
	xPos = (playerCore.bbox_right + playerCore.bbox_left) / 2;
	yPos =  playerCore.bbox_bottom;
	
	//Set camera state
	#region
	
	switch state
	{
		case CameraState.NORMAL:
		{
			if (collision_rectangle(playerCore.bbox_left, playerCore.bbox_top, playerCore.bbox_right, playerCore.bbox_bottom, obj_limitZone, false, true))
			{
				state = CameraState.LOCK_REGION;
				moveMode = 2;
			}
		}	break;

		case CameraState.LOCK_REGION:
		{
			if (!collision_rectangle(playerCore.bbox_left, playerCore.bbox_top, playerCore.bbox_right, playerCore.bbox_bottom, obj_limitZone, false, true))
			{
				state = CameraState.NORMAL;
				moveMode = 2;
			}
		}	break;

		case CameraState.FAILURE:
		default:
		{
			//Don't do anything ?
		}	break;
	}
	
	#endregion
	
	//Lock gate
	#region

	var _list = ds_list_create();
	var _num = collision_rectangle_list(X_VIEW, Y_VIEW, X_VIEW + W_NATIVE_RESOLUTION, Y_VIEW + H_NATIVE_RESOLUTION, obj_gate, false, false, _list, true);
	if (_num > 0)
	{
		if (_num == 1)
		{
			var gateObj = ds_list_find_value(_list, 0);
			var gateCenter = (gateObj.bbox_right + gateObj.bbox_left) / 2;
			if (gateObj.state != gateState.UNLOCKING)
			{
				var distance = gateCenter - x;
				if (distance > 16)
				{
					if (xPos > gateCenter + 16 - W_NATIVE_RESOLUTION/2)
					{
						xPos = gateCenter + 16 - W_NATIVE_RESOLUTION/2;
					}
				}
				else if (distance < -16)
				{
					if (xPos < gateCenter - 16 + W_NATIVE_RESOLUTION/2)
					{
						xPos = gateCenter - 16 + W_NATIVE_RESOLUTION/2;
					}
				}
			}
			else
				xPos = (playerCore.bbox_right + playerCore.bbox_left) / 2;
		}
		else if (_num > 1)
		{
			var _minX = room_width;
			var _maxX = 0;
			var allLock = true;
			for (var i = 0; i < ds_list_size(_list); ++i)
			{
				if (ds_list_find_value(_list, i).state == gateState.UNLOCKING)
				{
					allLock = false;
					break;
				}
				if ((ds_list_find_value(_list, i).x + 16) > _maxX)
					_maxX = ds_list_find_value(_list, i).x;
				if ((ds_list_find_value(_list, i).x + 16) < _minX)
					_minX = ds_list_find_value(_list, i).x;
			}
			if (allLock)
			{
				if ((_maxX - _minX) > W_NATIVE_RESOLUTION)
				{
					if (xPos > _maxX + 16 - W_NATIVE_RESOLUTION/2)
						xPos = _maxX + 16 - W_NATIVE_RESOLUTION/2;
					if (xPos < _minX - 16 + W_NATIVE_RESOLUTION/2)
						xPos = _minX - 16 + W_NATIVE_RESOLUTION/2;
				}
				else
				{
					if (state != CameraState.LOCK_REGION)
						xPos = (_maxX + 16 + _minX + 16) / 2;
				}
			}
			else
				xPos = (playerCore.bbox_right + playerCore.bbox_left) / 2;
		}
	}
	
	#endregion
	
	//Lock zone
	#region
	
	var zone = collision_rectangle(playerCore.bbox_left, playerCore.bbox_top, playerCore.bbox_right, playerCore.bbox_bottom, obj_limitZone, false, true);
	if (zone)
	{
		//Limit camera x position
		if (zone.verticalLock == true)
		{
			if (zone.bbox_width < W_NATIVE_RESOLUTION)
			{
				xPos = zone.x + zone.bbox_width/2;
			}
			else
			{
				if (xPos < zone.x + W_NATIVE_RESOLUTION/2)
					xPos = zone.x + W_NATIVE_RESOLUTION/2;
				if (xPos > zone.x + zone.bbox_width - W_NATIVE_RESOLUTION/2)
					xPos = zone.x + zone.bbox_width - W_NATIVE_RESOLUTION/2;
			}
		}
	
		//Limit camera y position
		if (zone.horizontalLock == true)
		{
			if (zone.bbox_height < H_NATIVE_RESOLUTION)
			{
				yPos = zone.y + zone.bbox_height/2;
			}
			else
			{
				if (yPos < zone.y + H_NATIVE_RESOLUTION/2)
					yPos = zone.y + H_NATIVE_RESOLUTION/2;
				if (yPos > zone.y + zone.bbox_height - H_NATIVE_RESOLUTION/2)
					yPos = zone.y + zone.bbox_height - H_NATIVE_RESOLUTION/2
			}
		}
	}
	
	#endregion
	
	//Move speed
	#region
	
	if (moveMode == 1)
	{
		x = xPos;
		y = yPos;
	}
	
	if (moveMode == 2)
	{
		if (distance_to_point(xPos, yPos) > moveSpd)
		{
			move_towards_point(xPos, yPos, moveSpd * global.deltaTime);
		}
		else
		{
			moveMode = 1;
		}
	}
	
	#endregion
	
	if (!zone || zone.vFixedCam == false)
		camera_set_view_pos(view_camera, xPos - W_VIEW/2, camera_get_view_y(view_camera));
	else
		camera_set_view_pos(view_camera, xPos - W_VIEW/2, yPos - H_VIEW/2);
}
else
{
	if (state == CameraState.FAILURE)
	{
		x = xPos;
		y = yPos;
	}
}


if (quake > 0)
{
	camera_set_view_pos(view_camera, X_VIEW, Y_VIEW + random_range(-2,2));
	quake -= global.deltaTime;
}