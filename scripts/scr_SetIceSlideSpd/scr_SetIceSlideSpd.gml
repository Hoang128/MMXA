function scr_SetIceSlideSpd(argument0, argument1) {
	var spd = argument0;
	var endMove = argument1;
	if(instance_exists(obj_iceController))
	{
		if (obj_iceController.playerOnIce == true)
		{
			if (endMove == true)
			{
				if (abs(spd) > abs(obj_iceController.iceSlideSpd))
				{
					if (!place_meeting(x, y + 1, obj_blockIceSlope))
					{
						obj_iceController.iceSlideSpd = spd;
						obj_iceController.iceSlideAcr = abs(spd / 40);
					}
				}
			}
			else
			{
				if (sign(spd) == sign(obj_iceController.iceSlideSpd))
				{
					obj_iceController.iceSlideSpd = 0;
					obj_iceController.iceSlideAcr = 0;
				}
			}
		}
	}


}
