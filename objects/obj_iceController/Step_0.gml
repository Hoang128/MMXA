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
				if ((keyboard_check_released(global.keyDash) && aState == ActionState.DASHING)
				|| ((keyboard_check_released(global.keyLeft) || keyboard_check_released(global.keyRight)) && aState == ActionState.IDLE)
				|| (dashTime == 0 && aState == ActionState.DASHING)
				|| (place_meeting(x + hDir, y, obj_block) && sprite_index == sprDash3))
				{
					if (place_meeting(x + hDir, y, obj_block) && sprite_index == sprDash3)
					{
						other.iceSlideSpd = self.dashSpdPhase2; 
						other.iceSlideAcr = abs(other.iceSlideSpd) / 40;
					}
					else
					{
						if (abs(other.iceSlideSpd) < abs(self.hspd))
						{
							other.iceSlideSpd = self.hspd; 
							other.iceSlideAcr = abs(other.iceSlideSpd) / 40;
						}
					}
				}
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
					if (sprite_index == sprRunStart || sprite_index == sprDash1)
						if (other.playerOnIce == true)
							other.iceSlideSpd = 0;
					if (!place_meeting(x + other.iceSlideSpd, y, obj_block))
						x += other.iceSlideSpd;
					else
						other.iceSlideSpd *= -1;
				}
					
				iceSlideSpd -= sign(iceSlideSpd) * iceSlideAcr;
			}
			else
			{
				iceSlideSpd = 0;
			}
		}
	}
}