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

	switch(obj_gameManager.playerCore)
	{
		case obj_playerEclipseX:
		{
			draw_sprite_part(draw_rectangle_color(6, 6, 70, 22, c_yellow, c_yellow, c_red, c_red, false), 0, 0, 0, 16, 64/obj_playerEclipseX.hp, 6, 6);
		}	break;
		case obj_playerZ:
		{
		}	break;
		default:	break;
	}
}