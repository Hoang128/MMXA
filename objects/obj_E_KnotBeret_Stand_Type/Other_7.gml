/// @description anim end

if (sprite_index == spr_knotBeretFall)
	image_index = 1;
	
if (sprite_index == spr_knotBeretLand)
{
	sprite_index = spr_knotBeretStand;
	image_index = 0;
}

if (sprite_index == spr_knotBeretThrowBomb
 || sprite_index == spr_knotBeretShot
 || sprite_index == spr_knotBeretShotUp)
{
	sprite_index = spr_knotBeretStand;
	image_index = 0;
	shot = 0;
	standTime = 0;
	state = 2;
}