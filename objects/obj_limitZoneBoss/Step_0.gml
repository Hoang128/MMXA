/// @description Insert description here
// You can write your code in this editor

if (init == false)
{
	init = true;
}
else
{
	switch (phase)
	{
		case 0:
		{
			if (!instance_exists(boss))
				instance_create_depth(X_VIEW + W_VIEW - (obj_gameManager.playerCore.x - X_VIEW), obj_gameManager.playerCore.y, obj_gameManager.playerCore.depth, boss);
			with(obj_gameManager.playerCore)
				activateState = ActivateState.ACTIVATE;
		}	break;
		case 1:
		{

		}	break;
	}
}