/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_gameManager.playerCore))
{
	draw_set_font(fnt_UIBoldSmall);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	xPlace = x;
	yPlace = y;
	scr_LOG_INFO(string(obj_gameManager.playerCore.hp),c_white, c_black);
	scr_LOG_INFO(string(lives),c_white, c_black);

	switch(obj_gameManager.playerCore.object_index)
	{
		case obj_playerEclipseX:
		{
			scr_LOG_INFO(string(obj_gameManager.playerCore.ArmorPoint),c_white, c_black);
		}	break;
		case obj_playerZ:
		{
		}	break;
		default:	break;
	}
}