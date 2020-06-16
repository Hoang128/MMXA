/// @description Insert description here
// You can write your code in this editor

switch (phase)
{
	case 0:
	{
		if (wait > 0) {
			wait--;
		}
		else
		{
			wait = 0;
			phase = 1;
			if (bossCutscene != noone)
				scr_setCutscene(bossCutscene);
		}
	}	break;
	case 1:
	{
		if (!instance_exists(bossCutscene))
		{
			phase = 2;
			instance_create_depth(X_VIEW, Y_VIEW, -1500, obj_warningEff);
		}
	}	break;
	case 2:
	{
		if (!instance_exists(obj_warningEff))
		{
			instance_create_depth(x, y, depth, boss);
			phase = 3;
		}
	}	break;
	case 3:
	{
		with(obj_gameManager.playerCore)
		{
			activateState = ActivateState.ACTIVATE;
		}
		phase = 4;
	}	break;
	case 4:
	{
		if (!instance_exists(boss))
		{
			scr_BGMStop();
			phase = 5;
		}
	}	break;
	case 5:
	{
		instance_destroy();
	}	break;
}