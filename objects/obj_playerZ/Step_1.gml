/// @description Config Hitbox and Sprite speed
switch(sprite_index)
{
	case sprDash1:
	case sprDash2:
	case sprDash3:
	case sprDuck1:
	case sprDuck2:
	case sprDuck3:
	case spr_ZSlashDuck:	mask_index = spr_playerHitBoxDuck;		break;
	default:				mask_index = spr_playerHitBoxNormal;	break;
}
image_xscale = hDir;

scr_InitImageSpeedPlayerHFormBase(obj_playerZ);

switch (sprite_index)
{
	case spr_ZEarthGaizer1:
	case spr_ZEarthGaizer2:
	{
		image_speed = 0.3;
	}
	case spr_ZSlashUp:	
	{
		if ((image_index <= 3) || (image_index >= 17))
			image_speed = 0.3;
		else
			image_speed = 0.5;
	}	break;
}

image_speed *= global.deltaTime;