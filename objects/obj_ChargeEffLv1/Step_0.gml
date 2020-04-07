/// @description Follow core
if ((core != noone) && (chargeParameter != noone))
if (instance_exists(core))
{
	if (chargeParameter < core.chargeLv1Limit) instance_destroy();
	x = (core.bbox_right + core.bbox_left) / 2;
	y = (core.bbox_top + core.bbox_bottom) / 2;
	image_xscale = core.image_xscale;
}