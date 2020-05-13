/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	Init
state 1:	Bullet delay
state 2:	Move vertical
state 3:	Move horizontal
*/

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;

switch (state)
{
	case 0:
	{
		vspd = -moveSpd;
		state = 2;
	}	break;
	
	case 1:
	{
		if (delayTime < delayTimeMax)
			delayTime += DELTA_TIME;
		else
		{
			hspd = image_xscale * moveSpd;
			delayTime = 0;
			state = 3;
		}
	}	break;
	
	case 2:
	{
		if (place_meeting(x, y, obj_block))	
		{
			createBulletEff = true;
			instance_destroy();
		}
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (abs(y - (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2) <= moveSpd)
			{
				sprite_index = spr_SeaHorseBullet2;
				image_index = 0;
				
				vspd = 0;
				state = 1;
			}
		}
	}	break;
	
	case 3:
	{
		if (place_meeting(x, y, obj_block))
		{
			createBulletEff = true;
			instance_destroy();
		}
	}	break;
}