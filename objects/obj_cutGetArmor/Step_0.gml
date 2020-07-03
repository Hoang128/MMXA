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
			
		}	break;
		case 2:
		{
		}	break;
	}
}
else
	instance_destroy();