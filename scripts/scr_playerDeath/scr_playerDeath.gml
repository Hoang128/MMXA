// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerDeath(objIndex){
	var number;
	switch (objIndex)
	{
		case obj_playerX:
		case obj_playerXUA:
		case obj_playerEclipseX:
			number = 0;	break;
		case obj_playerZ:
			number = 1;	break;
	}
	
	if (number <= 2)
	{
		if (global.hp[number] <= 0)
		{
			global.hp[number] = 0;
			if (weight < WeighType.MASSIVE)
			{
				hspd = 0;
				vspd = 0;
				hState = HorizontalState.H_MOVE_NONE;
				vState = VerticalState.V_MOVE_NONE;
				aState = ActionState.DYING;
				activateState = ActivateState.DEACTIVATE;
				sprite_index = sprStun1;
				image_index = 0;
			}
			else	instance_destroy();
		}
	}
}