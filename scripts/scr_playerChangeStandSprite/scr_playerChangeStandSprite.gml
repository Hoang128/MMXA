/// @description Intialize player change Sprite: scr_playerChangeStandSprite(object player)
/// @function Intialize BGM set: scr_playerChangeStandSprite
/// @param object player

//--------------------------------------------------
switch (argument0)
{
	case obj_playerX:	
	{
		if (hp <= 4)	sprStand = spr_XDying;
		else			sprStand = spr_XStand;
	}	break;
	
	case obj_playerZ:	
	{
		if (hp <= 4)	sprStand = spr_ZDying;
		else			sprStand = spr_ZStand;
	}	break;
}
//--------------------------------------------------