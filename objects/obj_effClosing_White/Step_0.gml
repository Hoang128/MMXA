/// @description Handle

if (image_alpha < 1)
{
	image_alpha += spd;
}
else 
{
	if (instance_exists(obj_effOpening_White))
	instance_destroy();
}