/// @description Insert description here
// You can write your code in this editor
switch (phase)
{
	case 0:
	{
		if (wait < waitTime * 2)
			wait++;
		else
		{
			audio_play_sound_on(global.SFX_Emitter, snd_explosionBoss, 0, 0);
			wait = 0;
			phase = 1;
		}
	}	break;
	case 1:
	{
		for (var i = 0; i < 3; i++)
		{
			for (var j = 0; j < 3; j++)
			{
				var eChain = instance_create_depth(x, y, layer_get_depth(obj_gameManager.lPlayer) - 1, obj_ExplosionChain);
				eChain.x = x - explosionRange / 3 + explosionRange / 3 * i;
				eChain.y = y - explosionRange / 3 + explosionRange / 3 * j;
				eChain.makeSound = false;
				eChain.dropItem = false;
				eChain.chainMax = 30;
				eChain.chainTimeMax = 10;
				eChain.rangeMax = explosionRange / 3;
			}
		}
		phase = 2;
	}	break;
	case 2:
	{
		if (wait < waitTime * 5)
			wait++;
		else
		{
			var effWhite = instance_create_depth(x, y, depth, obj_effClosing_White);
			effWhite.spd = 0.01;
			wait = 0;
			phase = 3;
		}
	}	break;
	case 3:
	{
		if (wait < waitTime * 2)
			wait++;
		else
		{
			instance_destroy(obj_effClosing_White);
			instance_destroy(obj_bossExplosionRay1);
			instance_destroy(obj_bossExplosionRay2);
			var effWhite = instance_create_depth(x, y, depth, obj_effOpening_White);
			effWhite.spd = 0.01;
			if (aliveAfterLose == true)
			{
				if (cutsceneLose != noone)
				{
					instance_create_depth(x, y, depth, cutsceneLose);
				}
				else
				{
					show_message("Don't have lose cutscene");
				}
			}
			visible = 0;
			wait = 0;
			phase = 4;
		}
	}	break;
	case 4:
	{
		if (!instance_exists(obj_effOpening_White))
		{
			instance_destroy();
		}
	}	break;
}


if ((phase == 2) || (phase == 3))
{
	if (effWait1 < effWaitRay1)
		effWait1++;
	else
	{
		objRay[0]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 2, obj_bossExplosionRay1);
		objRay[0].image_xscale=1;
        objRay[1]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 2, obj_bossExplosionRay1);
        objRay[1].image_xscale=-1;
		objRay[2]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 2, obj_bossExplosionRay1);
        objRay[2].image_xscale=sign(1-random(2));
		objRay[3]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 2, obj_bossExplosionRay1);
        objRay[3].image_xscale=1;
		objRay[4]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 2, obj_bossExplosionRay1);
        objRay[4].image_xscale=-1;
		objRay[5]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 2, obj_bossExplosionRay1);
        objRay[5].image_xscale=1;
		effWait1 = 0;
	}
	if (phase == 3)
	{
		if (effWait2 < effWaitRay2)
			effWait2++;
		else
		{
			for(var i = 0; i <4; i++)
				objRay[i]=instance_create_depth((bbox_left+bbox_right)/2, (bbox_top+bbox_bottom)/2, layer_get_depth(obj_gameManager.lPlayer) - 3, obj_bossExplosionRay2);
			effWait2 = 0;
		}
	}
}