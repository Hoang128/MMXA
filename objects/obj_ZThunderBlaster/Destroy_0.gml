/// @description Insert description here
// You can write your code in this editor
var obj = instance_create_depth(x,y,depth,obj_ZThunderBlasterEndEff);
obj.image_xscale = image_xscale;
if (loopTime >= loopTimeMax)
{
	with (obj_playerZ)
	{
		sprite_index = spr_ZShotNorG;
		image_index = 8;
		busterType = noone;
	}
}