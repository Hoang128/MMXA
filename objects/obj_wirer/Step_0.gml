/// @description Insert description here
// You can write your code in this editor

if (instance_exists(core))
{
	if (core.wirer == noone)
		instance_destroy();
	if (core.aState != ActionState.WIRING)
		instance_destroy();
	
	if (core.vspd > 0)	image_yscale = -1;
	else				image_yscale = 1;
	image_xscale = core.image_xscale;
	switch (core.wireType)
	{
		case WireType.HORIZONTAL:	sprite_index = spr_playerWirer_H;	break;
		case WireType.VERTICAL:		sprite_index = spr_playerWirer_V;	break;
		case WireType.NONE:			instance_destroy();					break;
	}
}
else	instance_destroy();