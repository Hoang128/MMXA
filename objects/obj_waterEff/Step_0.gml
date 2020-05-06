/// @description handle
event_inherited();

if (instance_exists(core))
{
	if (core.inWater == InLiquid.HALF)
	{
		x = core.x;
		image_xscale = core.image_xscale;
		if (core.hspd != 0)
		{
			sprite_index = spr_waterMoveEff;
			if (core.aState == ActionState.DASHING)
			{
				if (effTimming <= 0)
				{
					objEff = instance_create_depth(x, y, depth - 1, obj_waterSidePulseEff);
					objEff.image_xscale = image_xscale;
					effTimming = maxEffTimming;
				}
				else
				{
					effTimming -= DELTA_TIME;
				}
			}
		}
		else
		{
			sprite_index = spr_waterEff;
		}
	}
	else
		instance_destroy();
}
else	instance_destroy();