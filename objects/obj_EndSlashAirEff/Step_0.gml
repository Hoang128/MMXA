/// @description Handle

if (instance_exists(obj_playerZ) && (obj_playerZ.sprite_index == spr_ZSlashEnd_A))
{
	image_index = obj_playerZ.image_index;
	image_xscale = obj_playerZ.image_xscale;
	x = obj_playerZ.x;
	y = obj_playerZ.y;
}
else instance_destroy();