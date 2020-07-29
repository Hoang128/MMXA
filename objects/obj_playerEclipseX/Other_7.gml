/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprDash1)
{
	if (usedFArmorPointFlag)
	{
		var objSolarDashImpactEff = instance_create_depth(x + image_xscale * abs(bbox_right - bbox_left) / 2, (bbox_bottom + bbox_top) / 2, depth - 1, obj_solarDashImpactEff);
		objSolarDashImpactEff.image_xscale = image_xscale;
		objSolarDashImpactEff.depth = depth - 10;
	}
}

event_inherited();

switch (sprite_index)
{
	case sprDashKick1:
	{
		if (aState == ActionState.DASHING)
		{
			sprite_index = sprDashKick2;
			image_index = 0;
			
			dashPhase = 2;
			dashSpd = dashSpdPhase2;
			//var dashEff = instance_create_depth(x, bbox_bottom + 4, depth - 1, obj_XUADashUpEff);
			//dashEff.image_xscale = self.image_xscale;
			//dashEff.core = self;
	
			audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
		}
	}	break;
}

