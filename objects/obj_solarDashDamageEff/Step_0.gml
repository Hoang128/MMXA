/// @description Insert description here
// You can write your code in this editor
if (instance_exists(core))
{
	if ((core.aState == ActionState.DASHING) || (core.sprite_index == spr_XESlamDown))
	{
		if ((image_angle == 270) && (core.sprite_index != spr_XESlamDown))
			instance_destroy();
		x = core.x + xPlace * core.image_xscale;
		y = core.y + yPlace;
	}
	else	instance_destroy();
}
else	instance_destroy();