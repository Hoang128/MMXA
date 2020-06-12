/// @description Insert description here
// You can write your code in this editor

if (init == false)
{
	x = xStart;
	y = yStart;
	init = true;
}
else
{
	switch (phase)
	{
		case 1:
		{
			if (distance_to_point(xPos, yPos) > floatSpd)
				move_towards_point(xPos, yPos, floatSpd);
			else
			{
				x = xPos;
				y = yPos;
				phase = 2;
			}
		}	break;
		case 2:
		{
			if (indexTime < indexTimeMax)
			{
				x = xPos;
				y = yPos;
				indexTime++;
			}
			else
				phase = 3;
		}	break;
		case 3:
		{
			if (distance_to_point(xStart, yStart) > floatSpd)
				move_towards_point(xStart, yStart, floatSpd);
			else
			{
				instance_destroy();
			}
		}	break;
	}
}