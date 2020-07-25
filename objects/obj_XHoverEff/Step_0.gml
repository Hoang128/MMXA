/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if instance_exists(core)
{
//-----------------------------------------------
	if (core.aState == ActionState.HOVER)
	{
		self.image_xscale=core.image_xscale;
		self.x=core.x;
		self.y=core.y-4;
		if (core.sprite_index==core.sprHover)
		{
			sprite_index=spr_XHoverEff;
		}
		if (core.sprite_index==core.sprHoverFw)
		{
			sprite_index=spr_XHoverFWEff;
		}
		if (core.sprite_index==core.sprHoverBw)
		{
			sprite_index=spr_XHoverBWEff;
		}
	}
	else
	    instance_destroy();
//-----------------------------------------------
}
else
{
	instance_destroy();
}