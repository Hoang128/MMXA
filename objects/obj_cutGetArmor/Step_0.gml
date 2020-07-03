/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(obj_Capsule))
{
	switch(phase)
	{
		case 0:
		{
			if (waitTime < waitTimeMax)
			{
				waitTime++;
			}
			else
			{
				waitTime = 0;
				phase = 1;
			}
		}	break;
		case 1:
		{
			if (instance_exists(obj_Capsule))
			{
				if (obj_Capsule.phase == 0)
				{
					obj_Capsule.phase = 1;
					phase = 2;
				}
			}
		}	break;
		case 2:
		{
			if (instance_exists(obj_CapsuleDrLightProjection))
			{
				if (obj_CapsuleDrLightProjection.imgSpd > 0)
				{
					scr_messDrLight();
					phase = 3;
				}
			}
		}	break;
		case 3:
		{
			if (!instance_exists(obj_menuMessTextChain))
			{
				phase = 4;
			}
		}	break;
		case 4:
		{
			if (instance_exists(obj_Capsule))
			{
				if (obj_Capsule.phase == 3)
				{
					obj_Capsule.phase = 4;
				}
				if (obj_Capsule.phase == 5)
				{
					phase = 5;
				}
			}
		}	break;
	}
}
else
	instance_destroy();