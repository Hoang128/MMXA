/// @description Insert description here
// You can write your code in this editor

if (damageTimmer == -1)
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	if (guard == 0)
	{		
		
	}
	else
	{	
		if (other.object_index == obj_PlasmaBuster)
		{
			with (other)
			{
				if (orbCanCreate > 0)
				{
					if (canCreateOrb == 1)
					{
						orbCanCreate--;
						canCreateOrb -= waitTimeToCreateOrb * DELTA_TIME;
						var xPlace = clamp(x + (abs(sprite_width) - abs(sprite_xoffset)) * 0.75 * image_xscale, other.bbox_left, other.bbox_right);
						var yPlace = clamp((bbox_top + bbox_bottom) / 2, other.bbox_top, other.bbox_bottom);
						instance_create_depth(xPlace, yPlace, depth, obj_PlasmaOrb);
					}
				}
			}
		}
		
		//Create collision effect
		scr_createEnemyColGuardEff();
	}
	damageTimmer = other.maxTimmer;
}