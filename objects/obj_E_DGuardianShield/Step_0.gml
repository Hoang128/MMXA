/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (sprite_index == spr_DGuardian_Shield)
{
	if (shieldEff1 == noone)
	{
		shieldEff1 = instance_create_depth(x + 31 * image_xscale, y - 39, depth - 1, obj_E_GuardianShieldEff);
		shieldEff1.core = self;
		shieldEff1.top = true;
		shieldEff1.xPlace = 31;
		shieldEff1.yPlace = -39;
	}
	if (shieldEff2 == noone)
	{
		shieldEff2 = instance_create_depth(x + 31 * image_xscale, y + 19, depth - 1, obj_E_GuardianShieldEff);
		shieldEff2.core = self;
		shieldEff2.top = false;
		shieldEff2.xPlace = 31;
		shieldEff2.yPlace = 19;
	}
	if (engineEff1 == noone)
	{
		engineEff1 = instance_create_depth(x + 17 * image_xscale, y - 49, depth + 1, obj_E_GuardianShieldEngine);
		engineEff1.core = self;
		engineEff1.top = true;
		engineEff1.xPlace = 17;
		engineEff1.yPlace = -49;
	}
	if (engineEff2 == noone)
	{
		engineEff2 = instance_create_depth(x + 17 * image_xscale, y + 29, depth + 1, obj_E_GuardianShieldEngine);
		engineEff2.core = self;
		engineEff2.top = false;
		engineEff2.xPlace = 17;
		engineEff2.yPlace = 29;
	}
	if (!instance_exists(shieldEff1))
	{
		shieldEff1 = noone;
	}
	if (!instance_exists(shieldEff2))
	{
		shieldEff2 = noone;
	}
	if (!instance_exists(engineEff1))
	{
		engineEff1 = noone;
	}
	if (!instance_exists(engineEff2))
	{
		engineEff2 = noone;
	}
}
else
{
	shieldEff1 = noone;
	shieldEff2 = noone;
	engineEff1 = noone;
	engineEff2 = noone;
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