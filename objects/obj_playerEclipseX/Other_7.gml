/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprDash1)
{
	if (ArmorPoint > 0)
	{
		var objSolarDashDmgEff = instance_create_depth(x + image_xscale * 26, (bbox_bottom + bbox_top) / 2, depth - 1, obj_solarDashDamageEff);
		objSolarDashDmgEff.core = self;
		objSolarDashDmgEff.xPlace = 26;
		objSolarDashDmgEff.yPlace = (bbox_bottom + bbox_top) / 2 - y;
		objSolarDashDmgEff.image_xscale = image_xscale;
		objSolarDashDmgEff.depth = depth - 15;
	}
	if (usedFArmorPointFlag)
	{	
		var objSolarDashImpactEff = instance_create_depth(x + image_xscale * 40, (bbox_bottom + bbox_top) / 2, depth - 1, obj_solarDashImpactEff);
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
			var dashEff = instance_create_depth(x - 24 * image_xscale, y + 5, depth - 1, obj_PlayerDashEff);
			dashEff.core = self;
			dashEff.image_angle = 90 - 45 * image_xscale;
			
			if (ArmorPoint > 0)
			{
				var objSolarDashDmgEff = instance_create_depth(x + image_xscale * 26 * 1/sqrt(2), (bbox_bottom + bbox_top) / 2 - 26 * 1/sqrt(2), depth - 1, obj_solarDashDamageEff);
				objSolarDashDmgEff.core = self;
				objSolarDashDmgEff.xPlace = 24 * 1/sqrt(2);
				objSolarDashDmgEff.yPlace = (bbox_bottom + bbox_top) / 2 - 26 * 1/sqrt(2) - y;
				objSolarDashDmgEff.depth = depth - 15;
				objSolarDashDmgEff.image_angle = 90 - 45 * image_xscale;
			}
			if (usedFArmorPointFlag)
			{
				var objSolarDashImpactEff = instance_create_depth(x + image_xscale * 40 * 1/sqrt(2), (bbox_bottom + bbox_top) / 2 - 40 * 1/sqrt(2), depth - 1, obj_solarDashImpactEff);
				objSolarDashImpactEff.depth = depth - 10;
				objSolarDashImpactEff.image_angle = 90 - 45 * image_xscale;
			}
			audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
		}
	}	break;
	
	case sprDashCrossDown1:
	{
		if (aState == ActionState.DASHING)
		{
			sprite_index = sprDashCrossDown2;
			image_index = 0;
			
			dashPhase = 2;
			dashSpd = dashSpdPhase2;
			var dashEff = instance_create_depth(x - image_xscale * 18, y - 36, depth - 1, obj_PlayerDashEff);
			dashEff.core = self;
			dashEff.image_angle = 270 + 45 * image_xscale;
			
			if (ArmorPoint > 0)
			{
				var objSolarDashDmgEff = instance_create_depth(x + image_xscale * 26 * 1/sqrt(2), (bbox_bottom + bbox_top) / 2 + 26 * 1/sqrt(2), depth - 1, obj_solarDashDamageEff);
				objSolarDashDmgEff.core = self;
				objSolarDashDmgEff.xPlace = 26 * 1/sqrt(2);
				objSolarDashDmgEff.yPlace = (bbox_bottom + bbox_top) / 2 + 26 * 1/sqrt(2) - y;
				objSolarDashDmgEff.depth = depth - 15;
				objSolarDashDmgEff.image_angle = 270 + 45 * image_xscale;
			}
			if (usedFArmorPointFlag)
			{
				var objSolarDashImpactEff = instance_create_depth(x + image_xscale * 40 * 1/sqrt(2), (bbox_bottom + bbox_top) / 2 + 40 * 1/sqrt(2), depth - 1, obj_solarDashImpactEff);
				objSolarDashImpactEff.depth = depth - 10;
				objSolarDashImpactEff.image_angle = 270 + 45 * image_xscale;
			}
			audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
		}
	}	break;
	
	case spr_XEDoubleShot1_A:
	{
		if (comboStack == false)
		{
			if (vspd <= 0)
				sprite_index = sprJump2;
			else
				sprite_index = sprJump4;
			image_index = 0;
		
			atkState = AttackState.A_NONE;
		}
		else
		{
			sprite_index = spr_XEDoubleShot2_A;
			image_index = 0;
			
			createSolarChargeEff = false;
			comboStack = false;
			dashSpd = 0;
			dashTime = 0;
			atkState = AttackState.A_STRICT_ATTACK;
		}
	}	break;
	
	case spr_XEDoubleShot1_G:
	{
		if (comboStack == false)
		{
			sprite_index = sprStand;
			image_index = 0;
		
			atkState = AttackState.A_NONE;
		}
		else
		{
			sprite_index = spr_XEDoubleShot2_G;
			image_index = 0;
			
			hspd = 0;
			hState = HorizontalState.H_MOVE_NONE;
			createSolarChargeEff = false;
			comboStack = false;
			dashSpd = 0;
			dashTime = 0;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
	}	break;
	
	case spr_XEDoubleShot2_A:
	{
		if (vspd <= 0)
			sprite_index = sprJump2;
		else
			sprite_index = sprJump4;
		image_index = 0;
		
		atkState = AttackState.A_NONE;
		chargeNormal = 0;
		chargeStack = 0;
	}	break;
	
	case spr_XEDoubleShot2_G:
	{
		sprite_index = sprStand;
		image_index = 0;
		
		atkState = AttackState.A_NONE;
		chargeNormal = 0;
		chargeStack = 0;
	}	break;
}

