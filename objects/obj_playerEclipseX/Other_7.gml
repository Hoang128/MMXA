/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprDash1)
{
	if (usedFArmorPointFlag)
	{
		var objSolarDashImpactEff = instance_create_depth(x + image_xscale * (bbox_right - bbox_left) / 2, (bbox_bottom + bbox_top) / 2, depth - 1, obj_solarDashImpactEff);
		objSolarDashImpactEff.image_xscale = image_xscale;
	}
}

event_inherited();

