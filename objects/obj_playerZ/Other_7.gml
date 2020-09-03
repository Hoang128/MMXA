/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(sprite_index)
{
	case spr_ZDoubleJump:
	{
		image_index = 3;
	}	break;

	case spr_ZSlashEnd_G:
	{	
		if (atkState != AttackState.A_NONE)
			atkState = AttackState.A_NONE;
	
		sprite_index = sprStand;
		image_index = 0;
	}	break;

	case spr_ZSlashCombo1:
	case spr_ZSlashCombo2:
	case spr_ZSlashCombo3:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		standCombo = 0;
		if (atkState < AttackState.A_STRICT_ATTACK_LV3)
			atkState = AttackState.A_NONE;
		else scr_MeeleWeaponDestroy(obj_ZSaberImage);
	
		sprite_index = spr_ZSlashEnd_G;
		image_index = 0;
	}	break;

	case spr_ZSlashEnd_A:
	{
		if (atkState != AttackState.A_NONE)
			atkState = AttackState.A_NONE;
		instance_destroy(obj_EndSlashAirEff);
	
		if (vspd < 0)
			sprite_index = sprJump2;
		else
			sprite_index = sprJump4;
	}	break;

	case spr_ZSlashJump:
	case spr_ZSlashSpin:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		if (atkState < AttackState.A_STRICT_ATTACK_LV2)
			atkState = AttackState.A_NONE;
		else scr_MeeleWeaponDestroy(obj_ZSaberImage);
	
		instance_create_depth(x, y, depth, obj_EndSlashAirEff);
	
		sprite_index = spr_ZSlashEnd_A;
		image_index = 0;
	}	break;

	case spr_ZSlashLand:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		if (atkState != AttackState.A_NONE)
			atkState = AttackState.A_NONE;
	
		sprite_index = sprStand;
		image_index = 0;
	}	break;

	case spr_ZSlashDuck:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		atkState = AttackState.A_NONE;
		
		sprite_index = sprDuck2;
		image_index = 0;
	}	break;

	case spr_ZSlashSlide:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		atkState = AttackState.A_NONE;
	
		sprite_index = sprSlide2;
		image_index = 0;
	}	break;

	case spr_ZSlashClimb:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		atkState = AttackState.A_NONE;
		var moveUp = keyboard_check(global.keyUp);
		var moveDown = keyboard_check(global.keyDown);
		var vMove = moveUp - moveDown;
		if (vMove > 0)
		{
			if (moveUp) 
			{
				vState = VerticalState.V_MOVE_UP;
				vspd = -climbSpd;
				isClimbing = 1;
			}
			else
			{
				vState = VerticalState.V_MOVE_DOWN;
				vspd = climbSpd;
				isClimbing = -1;
			}
		}
	
		sprite_index = sprClimb2;
		image_index = 0;
	}	break;

	case spr_ZShotNorG:
	{
		atkState = AttackState.A_NONE;
	
		sprite_index = sprStand;
		image_index = 0;
	}	break;

	case spr_ZShotNorA:
	{
		atkState = AttackState.A_NONE;
		vState = VerticalState.V_MOVE_FALLING;
	
		sprite_index = sprJump3;
		image_index = 0;
	}	break;

	case spr_ZSlashCharge_A:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		atkState = AttackState.A_NONE;
		scr_MeeleWeaponDestroy(obj_ZSaberImage);
	
		if (vspd < 0)
			sprite_index = sprJump2;
		else
			sprite_index = sprJump4;
	}	break;

	case spr_ZSlashCharge_G:
	{
		canCharge = 1;
		canChargeTimmer = canChargeTimmerMax;
		atkState = AttackState.A_NONE;
		scr_MeeleWeaponDestroy(obj_ZSaberImage);
		aState = ActionState.IDLE;
	
		sprite_index = spr_ZSlashEnd_G;
		image_index = 0;
	}	break;

	case spr_ZShotC1_A:
	case spr_ZShotC2_A: 
	case spr_ZShotC3_A:
	{
		if (atkState != AttackState.A_NONE)
			atkState = AttackState.A_NONE;
		scr_MeeleWeaponDestroy(obj_ZSaberImage);
	
		if (vspd < 0)
			sprite_index = sprJump2;
		else
			sprite_index = sprJump4;
	}	break;

	case spr_ZShotC1_G:
	case spr_ZShotC2_G:
	case spr_ZShotC3_G:
	{
		if (atkState != AttackState.A_NONE)
			atkState = AttackState.A_NONE;
		scr_MeeleWeaponDestroy(obj_ZSaberImage);
	
		sprite_index = sprStand;
	}	break;

	case spr_ZSlashWired:
	{
		if (atkState != AttackState.A_NONE)
			atkState = AttackState.A_NONE;
		scr_MeeleWeaponDestroy(obj_ZSaberImage);
		
		sprite_index = sprWired;
		image_index = 0;
	}	break;
	
	case spr_ZSlashUp:
	{
		sprite_index = sprJump4;
		image_index = 0;
		
		scr_MeeleWeaponDestroy(obj_ZIceSaberImage);
		aState = ActionState.IDLE;
		vState = VerticalState.V_MOVE_FALLING;
		hState = HorizontalState.H_MOVE_NONE;
		atkState = AttackState.A_NONE;
		canClimb = true;
		hspd = 0;
		upperSlashTime = 0;
	}	break;
	
	case spr_ZSlashDash:
	{
		if (vState == VerticalState.V_ON_GROUND)
		{
			sprite_index = sprStand;
			image_index = 0;
		}
		else
		{
			sprite_index = sprJump3;
			image_index = 0;
			vState = VerticalState.V_MOVE_FALLING;
		}
		
		scr_MeeleWeaponDestroy(obj_ZFlameSaberImage);
		
		hState = HorizontalState.H_MOVE_NONE;
		atkState = AttackState.A_NONE;
		hspd = 0;
		vspd = 0;
	}	break;
	
	case spr_ZEarthGaizer1:
	case spr_ZEarthGaizer2:
	{
		sprite_index = sprStand;
		image_index = 0;
		
		earthGaizerCreateBullets = 0;
		earthGaizerChargeTime = 0;
		activateState = ActivateState.ACTIVATE;
		aState = ActionState.IDLE;
		atkState = AttackState.A_NONE;
	}
}