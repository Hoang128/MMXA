/// @description Insert description here
// You can write your code in this editor

if (instance_exists(core))
{
	if (core.wirer == noone)
		instance_destroy();
	if (core.aState != ActionState.WIRING)
		instance_destroy();

	image_xscale = core.image_xscale;
}
else	instance_destroy();