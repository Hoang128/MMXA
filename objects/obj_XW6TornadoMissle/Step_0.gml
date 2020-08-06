/// @description Insert description here
// You can write your code in this editor
if (!init)
{
	motion_set(firstDir, spd);
	init = true;
}
else
{
	if (phase == 0)
	{
		if (nonTargetTime < nonTargetTimeMax)
		{
			nonTargetTime += DELTA_TIME;
		}
		else
		{
			phase = 1;
		}
	}
	if (phase == 1)
	{
		motion_set(0, 0);
		phase = 2;
	}
	if (phase == 2)
	{
		if (!instance_exists(target))
		{
			
		}
		
		
	}
}