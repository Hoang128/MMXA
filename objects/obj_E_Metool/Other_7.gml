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

if (sprite_index == spr_metoolDown)
{
	sprite_index = spr_metoolGuard;
	image_index = 0;
	guard = 1;
	state = 4;
}

if (sprite_index == spr_metoolUp)
{
	sprite_index = spr_metoolRun;
	image_index = 0;
	hspd = moveSpd * image_xscale;
	timeToNextGuard = 0;
	state = 2;
}