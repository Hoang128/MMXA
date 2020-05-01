/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_metoolTrans)
{
	if (state == 5.1)
	{
		sprite_index = spr_metoolRun;
		image_index = 0;
		hspd = moveSpd * image_xscale;
		state = 2;
	}
}