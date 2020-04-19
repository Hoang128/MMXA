/// @description Controller
if instance_exists(obj_gameManager.playerCore)
{
	with(obj_gameManager.playerCore)
	{
		var colTopPart = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + (bbox_bottom - bbox_top) / 2, obj_water, false, false);
		var colBotPart = collision_rectangle(bbox_left, bbox_top + (bbox_bottom - bbox_top) / 2 + 1, bbox_right, bbox_bottom, obj_water, false, false);
		if (colTopPart && colBotPart)
		{
			if (inWater != InLiquid.FULL)
			{
				if (vState == VerticalState.V_MOVE_FALLING)
					vspd = vspd/maxGrav * MAX_FALL_WATER;
			}
			inWater = InLiquid.FULL;
		}
		else if (colBotPart && !colTopPart)
		{
			inWater = InLiquid.HALF;
		}
		else
		{
			inWater = InLiquid.NONE;
		}
	}
}