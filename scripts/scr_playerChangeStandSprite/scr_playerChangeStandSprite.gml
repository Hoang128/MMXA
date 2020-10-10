/// @description Intialize player change Sprite: scr_playerChangeStandSprite(object player)
/// @function Intialize BGM set: scr_playerChangeStandSprite
/// @param object player
function scr_playerChangeStandSprite(objIndex) {

	//--------------------------------------------------
	switch (objIndex)
	{
		case obj_playerX:
		case obj_playerEclipseX:
		{
			if (global.hp[0] <= 4)	sprStand = spr_XDying;
			else			sprStand = spr_XStand;
		}	break;
		
		case obj_playerXUA:
		{
			if (global.hp[0] <= 4)	sprStand = spr_XUADying;
			else			sprStand = spr_XUAStand;
		}	break;
	
		case obj_playerZ:	
		{
			if (global.hp[1] <= 4)	sprStand = spr_ZDying;
			else			sprStand = spr_ZStand;
		}	break;
	}
	//--------------------------------------------------


}
