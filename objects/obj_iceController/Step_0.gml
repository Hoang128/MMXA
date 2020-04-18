/// @description Player on da ice
if (instance_exists(obj_gameManager.playerCore))
{
	if (obj_gameManager.playerCore.weight < WeighType.MASSIVE)
	{
		with(obj_gameManager.playerCore)
		{
			if (place_meeting(x, y + 1, obj_blockIce))
			{
				other.playerOnIce = true;
			}
			else
			{
				other.playerOnIce = false;
			}
		}
		
		if (iceSlideSpd != 0)
		{
			if (abs(iceSlideSpd) > iceSlideAcr)
			{
				with (obj_gameManager.playerCore)
				{
					if (!place_meeting(x + other.iceSlideSpd, y, obj_block))
						x += other.iceSlideSpd * global.deltaTime;
					else
						other.iceSlideSpd *= -1;
				}
					
				iceSlideSpd -= sign(iceSlideSpd) * iceSlideAcr * global.deltaTime;
			}
			else
			{
				iceSlideSpd = 0;
			}
		}
	}
}