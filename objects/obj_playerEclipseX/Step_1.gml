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

switch(sprite_index)
{
	case spr_XShotStand:	image_speed = 0.5; break;
	case spr_XCShotStand:
	case spr_XCShotDuck:	image_speed = 0.8; break;
	case spr_XShotClimb:	image_speed = 0.3; break;
	case sprDashCrossDown1:
	case sprDashCrossDown2:	image_speed = 0.5; break;
}

image_speed *= DELTA_TIME;