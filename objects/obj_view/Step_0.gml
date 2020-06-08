/// @description Change elem in real-time
playerCore = obj_gameManager.playerCore;

if (playerCore != noone)
{	
	xPlayer = (playerCore.bbox_right + playerCore.bbox_left) / 2;
	yPlayer =  playerCore.bbox_bottom;
	
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

	//Move speed
	#region
	
	if (moveMode == 1)
	{
		x = xPlayer;
		y = yPlayer;
	}
	
	if (moveMode == 2)
	{
		if (distance_to_point(xPlayer, yPlayer) > moveSpd)
		{
			move_towards_point(xPlayer, yPlayer, moveSpd * global.deltaTime);
		}
		else
		{
			moveMode = 1;
		}
	}
	
	#endregion
	
	camera_set_view_pos(view_camera, xPlayer - W_VIEW/2, yPlayer - H_VIEW/2);
}
else
{
	if (state == CameraState.FAILURE)
	{
		x = xPlayer;
		y = yPlayer;
	}
}


if (quake > 0)
{
	camera_set_view_pos(view_camera, X_VIEW, Y_VIEW + random_range(-2,2));
	quake -= global.deltaTime;
}