/// @description Insert description here
// You can write your code in this editor
if (init == 0)
{
	if (lv == 1)
		busterNumber = 5;
	else
		busterNumber = 10;
	init = 1;
}
else
{
	if (!instance_exists(obj_playerZ))
		instance_destroy();
	if (busterNumber > -3)
	{
		if (createTime < createTimeMax)
		{
			createTime += DELTA_TIME;
		}
		else
		{
			createTime = 0;
		
			if (busterNumber > 0)
			{
				var objShotEff = instance_create_depth(x, y, depth, obj_ShotEffZBusterCharge);
				objShotEff.barrage = 1;
				objShotEff.core = obj_playerZ;
				objShotEff.image_xscale = image_xscale;
			
				if (lv == 2)
				{
					switch(busterNumber)
					{
						case 10:	objShotEff.busterVspd = 2	* vspace;	break;
						case 9:		objShotEff.busterVspd = -1	* vspace;	break;
						case 8:		objShotEff.busterVspd = 3	* vspace;	break;
						case 7:		objShotEff.busterVspd = -5	* vspace;	break;
						case 6:		objShotEff.busterVspd = 4	* vspace;	break;
						case 5:		objShotEff.busterVspd = -4	* vspace;	break;
						case 4:		objShotEff.busterVspd = -3	* vspace;	break;
						case 3:		objShotEff.busterVspd = 5	* vspace;	break;
						case 2:		objShotEff.busterVspd = -2	* vspace;	break;
						case 1:		objShotEff.busterVspd = 1	* vspace;	break;
					}
				}
			
				else
				{
					switch(busterNumber)
					{
						case 5:		objShotEff.busterVspd = 0	* vspace;	break;
						case 4:		objShotEff.busterVspd = -2	* vspace;	break;
						case 3:		objShotEff.busterVspd = 1	* vspace;	break;
						case 2:		objShotEff.busterVspd = 2	* vspace;	break;
						case 1:		objShotEff.busterVspd = -1	* vspace;	break;
					}
				}
			}
		
			busterNumber--;
		}
	}
	else	instance_destroy();
}