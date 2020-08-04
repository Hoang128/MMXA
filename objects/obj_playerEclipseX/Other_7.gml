/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sprDash1)
{
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
	case spr_XEJumpBack1:
	{
		sprite_index = spr_XEJumpBack2;
	}	break;
	
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
			
			if (usedFArmorPointFlag)
			{
				var objSolarDashImpactEff = instance_create_depth(x + image_xscale * 40 * 1/sqrt(2), (bbox_bottom + bbox_top) / 2 + 40 * 1/sqrt(2), depth - 1, obj_solarDashImpactEff);
				objSolarDashImpactEff.depth = depth - 10;
				objSolarDashImpactEff.image_angle = 270 + 45 * image_xscale;
			}
			audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
		}
	}	break;
	
	case spr_XEJumpBack3:
	{
		if (!keyboard_check(global.keyJump))
		{
			sprite_index = sprJump4;
			image_index = 0;
		
			canBeHit = true;
			inAir = InAir.NORMAL;
			activateState = ActivateState.ACTIVATE;
			aState = ActionState.IDLE;
		}
		else
		{
			sprite_index = spr_XEHover;
			image_index = 0;
			
			canBeHit = true;
			inAir = InAir.NORMAL;
			vState = VerticalState.V_MOVE_DOWN;
			activateState = ActivateState.ACTIVATE;
			aState = ActionState.IDLE;
		}
	}
}

