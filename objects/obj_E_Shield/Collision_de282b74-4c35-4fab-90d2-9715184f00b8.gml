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
						instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth, obj_PlasmaOrb);
					}
				}
			}
		}
		
		//Create collision effect
		scr_createEnemyColGuardEff();
	}
	damageTimmer = other.maxTimmer;
}