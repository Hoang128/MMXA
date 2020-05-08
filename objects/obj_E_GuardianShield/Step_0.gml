/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (sprite_index == spr_Guardian_Shield)
{
	if (shieldEff1 == noone)
	{
		shieldEff1 = instance_create_depth(x + 29 * image_xscale, y - 22, depth - 1, obj_E_GuardianShieldEff);
		shieldEff1.core = self;
		shieldEff1.top = true;
		shieldEff1.xPlace = 29;
		shieldEff1.yPlace = -22;
	}
	if (shieldEff2 == noone)
	{
		shieldEff2 = instance_create_depth(x + 29 * image_xscale, y + 2, depth - 1, obj_E_GuardianShieldEff);
		shieldEff2.core = self;
		shieldEff2.top = false;
		shieldEff2.xPlace = 29;
		shieldEff2.yPlace = 2;
	}
	if (!instance_exists(shieldEff1))
	{
		shieldEff1 = noone;
	}
	if (!instance_exists(shieldEff2))
	{
		shieldEff2 = noone;
	}
}
else
{
	shieldEff1 = noone;
	shieldEff2 = noone;
}

if (!instance_exists(core))
	instance_destroy();
else
{
	if (core.shield != self)
		instance_destroy();
	else
	{
		x = core.x;
		y = core.y;
	}
}