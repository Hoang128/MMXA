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
			switch(boss)
			{
				case obj_dynamo:	scr_setCutscene(obj_cutsceneBossDynamo);	break;
				default:			phase = 2;									break;
			}
		}
	}	break;
	case 1:
	{
		if (!instance_exists(obj_cutsceneManager))
		{
			phase = 2;
			instance_create_depth(X_VIEW, Y_VIEW, -1500, obj_warningEff);
		}
	}	break;
	case 2:
	{
		if (!instance_exists(obj_warningEff))
		{
			phase = 3;
		}
	}	break;
	case 4:
	{
		with(obj_gameManager.playerCore)
		{
			activateState = ActivateState.ACTIVATE;
		}
		phase = 5;
	}	break;
	case 5:
	{
		if (!instance_exists(boss))
		{
			scr_BGMStop();
			phase = 6;
		}
	}	break;
	case 6:
	{
		instance_destroy();
	}	break;
}