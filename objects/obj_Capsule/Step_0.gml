/// @description Insert description here
// You can write your code in this editor

switch (phase)
{
	case 0:
	{
	}	break;
	case 1:
	{
		if (greenF.phase == 0)
		{
			scr_BGMStop();
			greenF.phase = 1;
		}
		
		if (waitTime < waitDrLightPRJTimeMax)
		{
			waitTime++;
		}
		else
		{
			waitTime = 0;
			phase = 2;
			scr_BGMSet(bgm_DrLight, false);
		}
	}	break;
	case 2:
	{
		if (!instance_exists(obj_CapsuleDrLightProjection))
			instance_create_depth(x, y, depth - 1, obj_CapsuleDrLightProjection);
		if (waitTime < waitDrLightPRJToTalk)
		{
			waitTime++;
		}
		else
		{
			waitTime = 0;
			obj_CapsuleDrLightProjection.imgSpd = 0.25;
			phase = 3;
		}
	}	break;
	case 4:
	{
		if (greenF.phase == 1)
		{
			greenF.phase = 2;
			instance_destroy(obj_CapsuleDrLightProjection);
		}
		if (!instance_exists(greenF))
		{
			scr_BGMStop();
			phase = 5;
		}
	}	break;
}