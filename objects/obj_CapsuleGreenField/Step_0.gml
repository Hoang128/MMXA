/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
		image_alpha = 0.8;
	}	break;
	case 1:
	{
		if (lightLoop < lightLoopMax)
		{
			lightLoop++;
		}
		else
			lightLoop = 0;
		if (lightLoop < lightLoopMax / 2)
			image_alpha = 0.8;
		else
			image_alpha = 0.1;
	}	break;
	case 2:
	{
		if (lightLoop < lightLoopMax)
		{
			lightLoop++;
		}
		else
			lightLoop = 0;
		if (lightLoop < lightLoopMax / 2)
			image_alpha = 0.8;
		else
			image_alpha = 0.1;
			
		if (hDraw > 0)
		{
			yDraw += disappearSpd;
			hDraw -= disappearSpd;
		}
		else
			instance_destroy();
	}	break;
}