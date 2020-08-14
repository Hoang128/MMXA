/// @description Insert description here
// You can write your code in this editor

if (init == false)
{
	if (instance_exists(obj_gameManager.playerCore))
	{
		image_xscale = obj_gameManager.playerCore.image_xscale;
		init = true;
	}	
	else	instance_destroy();
}
else
{
	if (instance_exists(obj_gameManager.playerCore))
	{
		x = obj_gameManager.playerCore.x;
		y = obj_gameManager.playerCore.y;
	}
	if (missleShot < 8)
	{
		if (timeWait < timeWaitMax)
			timeWait += DELTA_TIME;
		else
		{
			var xCreate = X_VIEW + W_VIEW / 2 * (1 - image_xscale);
			var yCreate = 0;
			var yCount = 0;
			switch (missleShot)
			{
				case 0:	yCount = 6;	break;
				case 1: yCount = 2;	break;
				case 2: yCount = 4;	break;
				case 3: yCount = 1;	break;
				case 4: yCount = 3;	break;
				case 5: yCount = 7;	break;
				case 6: yCount = 8;	break;
				case 7: yCount = 5;	break;
			}
			yCreate = Y_VIEW + H_VIEW/10 * yCount;
			var objMissle = instance_create_depth(xCreate, yCreate, depth - 1, obj_XW6TornadoMissleCharge);
			objMissle.image_xscale = image_xscale;
			missleShot++;
			timeWait = 0;
		}
	}	else instance_destroy();
}