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
			if (!instance_exists(obj_bossManager))
			{
				var bossMgr = instance_create_depth(X_VIEW + W_VIEW - (obj_gameManager.playerCore.x - X_VIEW), obj_gameManager.playerCore.y, obj_gameManager.playerCore.depth, obj_bossManager);
				bossMgr.boss = self.boss;
			}
		}	break;
		case 1:
		{

		}	break;
	}
}