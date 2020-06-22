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
				case obj_dynamo:	scr_setCutscene(obj_cutBossDynamo);	break;
				default:			phase = 2;									break;
			}
		}
	}	break;
	case 1:
	{
		if (!instance_exists(obj_cutsceneManager))
		{
			phase = 1.5;
		}
	}	break;
	case 1.5:
	{
		if (wait < waitTimeMax)
		{
			wait++;
		}
		else
		{
			instance_create_depth(X_VIEW, Y_VIEW, -1500, obj_warningEff);
			wait = 0;
			phase = 2;
		}
	}	break;
	case 2:
	{
		if (!instance_exists(obj_warningEff))
		{
			phase = 2.5;
		}
	}	break;
	case 2.5:
	{
		if (wait < waitTimeMax)
			wait++;
		else
		{
			wait = 0;
			phase = 3;
		}
	}	break;
	case 3.5:
	{
		if (wait < waitTimeMax)
			wait++;
		else
		{
			wait = 0;
			phase = 4;
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
		if (!instance_exists(obj_bossLose))
			phase = 6.5;
	}	break;
	case 6.5:
	{
		if (wait < waitTimeMax * 2)
			wait++;
		else
		{
			wait = 0;
			phase = 7;
		}
	}	break;
	case 7:
	{
		if (!instance_exists(obj_cutsceneManager))
			phase = 7.5;
	}	break;
	case 7.5:
	{
		if (wait < waitTimeMax)
			wait++;
		else
		{
			wait = 0;
			phase = 8;
		}
	}	break;
	case 8:
	{
		instance_destroy();
	}	break;
}