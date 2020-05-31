/// @description Follow the right object
// You can write your code in this editor
if (instance_exists(playerCore))
{
	playerCore = obj_gameManager.playerCore;
	if (instance_exists(playerCore))
	depth = playerCore.depth - 1;
	
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
	
	var xPlayer = (playerCore.bbox_right + playerCore.bbox_left) / 2;
	var yPlayer = (playerCore.bbox_top + playerCore.bbox_bottom) / 2;

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
				xPlayer = zone.x + zone.bbox_width/2;
			}
			else
			{
				if (xPlayer < zone.x + W_NATIVE_RESOLUTION/2)
					xPlayer = zone.x + W_NATIVE_RESOLUTION/2;
				if (xPlayer > zone.x + zone.bbox_width - W_NATIVE_RESOLUTION/2)
					xPlayer = zone.x + zone.bbox_width - W_NATIVE_RESOLUTION/2;
			}
		}
	
		//Limit camera y position
		if (zone.horizontalLock == true)
		{
			if (zone.bbox_height < H_NATIVE_RESOLUTION)
			{
				yPlayer = zone.y + zone.bbox_height/2;
			}
			else
			{
				if (yPlayer < zone.y + H_NATIVE_RESOLUTION/2)
					yPlayer = zone.y + H_NATIVE_RESOLUTION/2;
				if (yPlayer > zone.y + zone.bbox_height - H_NATIVE_RESOLUTION/2)
					yPlayer = zone.y + zone.bbox_height - H_NATIVE_RESOLUTION/2
			}
		}
	}
	
	#endregion

	//Lock gate
	#region
	var _list = ds_list_create();
	var _num = collision_rectangle_list(X_VIEW, Y_VIEW, X_VIEW + W_NATIVE_RESOLUTION, Y_VIEW + H_NATIVE_RESOLUTION, obj_gate, false, false, _list, true);
	if (_num > 0)
	{
		if (collision_rectangle(playerCore.bbox_left, playerCore.bbox_top, playerCore.bbox_right, playerCore.bbox_bottom, obj_gate, false, true))
		{
			if (moveMode == 1)
				moveMode = 2;
		}
		else
		{
			if (moveMode == 1)
				moveMode = 2;
		}
		if (_num == 1)
		{
			var gateObj = ds_list_find_value(_list, 0);
			var gateCenter = (gateObj.bbox_right + gateObj.bbox_left) / 2;
			if (gateObj.state != gateState.UNLOCKING)
			{
				var distance = gateCenter - x;
				if (distance > 16)
				{
					if (xPlayer > gateCenter + 16 - W_NATIVE_RESOLUTION/2)
					{
						xPlayer = gateCenter + 16 - W_NATIVE_RESOLUTION/2;
					}
				}
				else if (distance < -16)
				{
					if (xPlayer < gateCenter - 16 + W_NATIVE_RESOLUTION/2)
					{
						xPlayer = gateCenter - 16 + W_NATIVE_RESOLUTION/2;
					}
				}
			}
			else
				xPlayer = (playerCore.bbox_right + playerCore.bbox_left) / 2;
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
					if (xPlayer > _maxX + 32 - W_NATIVE_RESOLUTION/2)
						xPlayer = _maxX + 32 - W_NATIVE_RESOLUTION/2;
					if (xPlayer < _minX - 32 + W_NATIVE_RESOLUTION/2)
						xPlayer = _minX - 32 + W_NATIVE_RESOLUTION/2;
				}
				else
				{
					xPlayer = (_maxX + _minX) / 2;
				}
			}
			else
				xPlayer = (playerCore.bbox_right + playerCore.bbox_left) / 2;
		}
	}
	
	#endregion

	if (moveMode == 2)
	{
		if (distance_to_point(xPlayer, yPlayer) > moveSpd)
		{
			move_towards_point(xPlayer, yPlayer, moveSpd * global.deltaTime);
		}
		else
			moveMode = 1;
	}
						
	if (moveMode == 1)
	{
		x = xPlayer;
		y = yPlayer;
	}
}