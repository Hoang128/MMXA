/// @description Insert description here
// You can write your code in this editor
if (instance_exists(core))
{
	image_xscale = core.image_xscale;
	image_yscale = core.image_yscale;
	depth = core.depth + 1;
}
else
	instance_destroy();