/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (damageTimmer > 0) damageTimmer -= global.deltaTime;
if (hp <= 0) instance_destroy();

if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
{
	if (distance_to_object(parent) > distanceToParentLimit)
	{
		createExplosion = false;
		parent.child = noone;
		instance_destroy();
	}
}

if (physicAffected == true)
{
	//Gravity
	#region
	
	if (place_meeting(x, y + 1, obj_block))
	{
		vspd = 0;
	}
	else
	{
		if (vspd < MAX_FALL_AIR)
		{
			vspd += GRAVITY_AIR;
		}
		else
			vspd = MAX_FALL_AIR;
	}
	
	#endregion
	
	//Horizontal
	#region
	
	if (place_meeting(x + hspd, y, obj_block))
	{
		while(!place_meeting(x + sign(hspd), y, obj_block))
		{
			x += sign(hspd);
		}
		if (!place_meeting(x + hspd, y - maxDisDetectSlopeAbove, obj_block))
		{
			while (place_meeting(x + hspd, y, obj_block)) y--;
		}
		else
			hspd = 0;
	}
	
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
	
	#endregion
}

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;