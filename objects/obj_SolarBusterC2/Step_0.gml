/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!createEff)
{
	if (level == 1)
	{
		var objEff = instance_create_depth(x, y, depth - 1, obj_SolarBusterC2Eff1);
		objEff.image_xscale = image_xscale;
		objEff.xPlace = 16;
		objEff.yPlace = 0;
		objEff.core = self;
	}
	else if (level == 2)
	{
		var objEff = instance_create_depth(x, y, depth - 1, obj_SolarBusterC2Eff2);
		objEff.image_xscale = image_xscale;
		objEff.xPlace = 16;
		objEff.yPlace = 0;
		objEff.core = self;
	}
	createEff = true;
}