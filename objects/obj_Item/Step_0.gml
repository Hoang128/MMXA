/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y + 1, obj_block))
{
	vspd = 0;
}
else
{
	if (vspd < MAX_FALL_AIR)
		vspd += GRAVITY_AIR;
	else
		vspd = MAX_FALL_AIR;
}


//Horizontal
#region
	
if (place_meeting(x + hspd, y, obj_block))
{
	while(!place_meeting(x + sign(hspd), y, obj_block))
	{
		x += sign(hspd);
	}
		
	hspd = 0;
}
	
x += hspd * DELTA_TIME;
	
#endregion
	
//Vertical
#region

if (place_meeting(x, y + vspd, obj_block))
{
	while(!place_meeting(x, y + sign(vspd), obj_block))
	{
		y += sign(vspd);
	}
	
	vspd = 0;
}
	
y += vspd * DELTA_TIME;
	
#endregion

if (canBeFade == true)
{
	if (time > 0)
	{
		time -= DELTA_TIME;
		if (time <= timeAlert)
		{
			if (cycleEff < cycleEffMax)
			{
				if (cycleEff < cycleEffMax / 2) 
					image_alpha = 0.1;
				else	
					image_alpha = 1;
				cycleEff += DELTA_TIME;
			}
			else	
				cycleEff = 0;
		}
	}
	else
		instance_destroy();
}