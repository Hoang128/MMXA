/// @description Config Hitbox and Sprite speed
switch(sprite_index)
{
	case sprDash1:
	case sprDash2:
	case sprDash3:
	case sprDuck1:
	case sprDuck2:
	case sprDuck3:	mask_index = spr_playerHitBoxDuck;		break;
	default:		mask_index = spr_playerHitBoxNormal;	break;
}
image_xscale = hDir;

scr_InitImageSpeedPlayerHFormBase(obj_playerX);