/// @description Insert description here
// You can write your code in this editor

if (sprite_index == spr_KillerMothTrans)
{
	Center_X = self.x; // x of orbital center
    Center_Y = self.y + Orbit; // y of orbital center
	state = 4;
	sprite_index = spr_KillerMothNormal;
	image_index = 0;
	image_speed = 1;
	
	if (!instance_exists(obj_E_KillerMothEngine))
	{
		engine = instance_create_depth(x, y + 13, depth, obj_E_KillerMothEngine);
		engine.core = self;
	}
}