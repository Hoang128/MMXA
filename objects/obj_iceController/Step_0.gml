/// @description Player on da ice
if (instance_exists(obj_gameManager.playerCore))
{
	if (obj_gameManager.playerCore.weight < WeighType.MASSIVE)
	{
		with(obj_gameManager.playerCore)
		{
			if (place_meeting(x, y + 1, obj_blockIce) || place_meeting(x, y + 1, obj_blockIceSlope))
			{
				other.playerOnIce = true;
				if (place_meeting(x, y + 1, obj_blockIceSlope))
				{
					other.iceSlideSlope = instance_nearest(x, y + 1, obj_blockIceSlope).iceSlideSlope;
				}
				else
				{
					if (other.iceSlideSlope != 0)
					{
						if (!(sign(hspd) * sign(other.iceSlideSlope) == -1 && place_meeting(x, y + 1, obj_block)))
						{
							other.iceSlideSpd = other.iceSlideSlope;
							other.iceSlideAcr = abs(other.iceSlideSpd) / 40;
						}
					}
					other.iceSlideSlope = 0;
				}
			}
			else
			{
				other.playerOnIce = false;
				if (other.iceSlideSlope != 0)
				{
					if (!(sign(hspd) * sign(other.iceSlideSlope) == -1 && place_meeting(x, y + 1, obj_block)))
					{
						other.iceSlideSpd = other.iceSlideSlope;
						other.iceSlideAcr = abs(other.iceSlideSpd) / 40;
					}
				}
				other.iceSlideSlope = 0;
			}
		}
		
		if (iceSlideSpd != 0)
		{
			if (abs(iceSlideSpd) > iceSlideAcr)
			{
				with (obj_gameManager.playerCore)
				{
					if (!place_meeting(x + other.iceSlideSpd, y, obj_block) && (!place_meeting(x + other.iceSlideSpd, y, obj_blockIceSlope) && !place_meeting(x + other.iceSlideSpd, y, obj_slope)))
						x += (other.iceSlideSpd) * global.deltaTime;
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
		
		if (iceSlideSlope != 0)
		{
			with (obj_gameManager.playerCore)
			{
				if (!place_meeting(x + other.iceSlideSlope, y, obj_block) && (!place_meeting(x + other.iceSlideSlope, y, obj_blockIceSlope) && !place_meeting(x + other.iceSlideSlope, y, obj_slope)))
					x += (other.iceSlideSlope) * global.deltaTime;
			}
		}
	}
}