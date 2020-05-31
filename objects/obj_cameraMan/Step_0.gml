/// @description Follow the right object
// You can write your code in this editor
playerCore = obj_gameManager.playerCore;
if (instance_exists(playerCore))
depth = playerCore.depth - 1;

switch state
{
	case CameraState.NORMAL:
	{
		if (instance_exists(playerCore))
		{
			if (playerCore.activateState != ActivateState.DEACTIVATE)
			{
				var xPlayer = (playerCore.bbox_right + playerCore.bbox_left) / 2;
				var yPlayer = (playerCore.bbox_top + playerCore.bbox_bottom) / 2;
				
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
				
				if (collision_rectangle(playerCore.bbox_left, playerCore.bbox_top, playerCore.bbox_right, playerCore.bbox_bottom, obj_limitZone, false, true))
				{
					state = CameraState.LOCK_REGION;
					moveMode = 2;
				}
			}
		}
	}	break;
	
	case CameraState.LOCK_REGION:
	{
		if (instance_exists(playerCore))
		{
			var zone = collision_rectangle(playerCore.bbox_left, playerCore.bbox_top, playerCore.bbox_right, playerCore.bbox_bottom, obj_limitZone, false, true);
			if (zone)
			{
				var xPlayer = (playerCore.bbox_right + playerCore.bbox_left) / 2;
				var yPlayer = (playerCore.bbox_top + playerCore.bbox_bottom) / 2;
				
				//Limit camera x position
				if (zone.verticalLock == true)
				{
					xPlayer = clamp(xPlayer, zone.x + W_NATIVE_RESOLUTION/2, zone.x + zone.bbox_width - W_NATIVE_RESOLUTION/2);
					if (zone.bbox_width < W_NATIVE_RESOLUTION)
					{
						xPlayer = zone.x + zone.bbox_width/2;
					}
				}
	
				//Limit camera y position
				if (zone.horizontalLock == true)
				{
					yPlayer = clamp(yPlayer, zone.y + H_NATIVE_RESOLUTION/2, zone.y + zone.bbox_height - H_NATIVE_RESOLUTION/2);
					if (zone.bbox_height < H_NATIVE_RESOLUTION)
					{
						yPlayer = zone.y + zone.bbox_height/2;
					}
				}
				
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
			else
			{
				state = CameraState.NORMAL;
				moveMode = 2;
			}
		}
	}	break;	

	case CameraState.FAILURE:
	default:
	{
		//Don't do anything ?
	}	break;
}