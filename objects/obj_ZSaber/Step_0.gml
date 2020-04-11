/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (setupState)
{
	switch (state)
	{
		case SaberState.SABER_COMBO_1:			{ sprite_index = spr_ZSaberHBCombo1;		maxTimmer = 6;	slowTime = false; }	break;
		case SaberState.SABER_COMBO_2:			{ sprite_index = spr_ZSaberHBCombo2;		maxTimmer = 4;	slowTime = false; }	break;
		case SaberState.SABER_COMBO_3:			{ sprite_index = spr_ZSaberHBCombo3;		maxTimmer = 2;	slowTime = true;  }	break;
		case SaberState.SABER_JUMP_SLASH:		{ sprite_index = spr_ZSaberHBSlashJump;		maxTimmer = 1;	slowTime = true;  }	break;
		case SaberState.SABER_LAND_SLASH:		{ sprite_index = spr_ZSaberHBSlashLand;		maxTimmer = 1;	slowTime = true;  }	break;
		case SaberState.SABER_DUCK_SLASH:		{ sprite_index = spr_ZSaberHBSlashDuck;		maxTimmer = 2;	slowTime = true; }	break;
		case SaberState.SABER_SPIN_SLASH:		{ sprite_index = spr_ZSaberHBSlashSpin;		maxTimmer = 3;	slowTime = true;  }	break;
		case SaberState.SABER_SLIDE_SLASH:		{ sprite_index = spr_ZSaberHBSlashSlide;	maxTimmer = 8;	slowTime = false; }	break;
		case SaberState.SABER_CLIMB_SLASH:		{ sprite_index = spr_ZSaberHBSlashClimb;	maxTimmer = 8;	slowTime = false; }	break;
		case SaberState.SABER_CHARGE_SLASH:		
		{ 
			slowTime = true;
			if (global.zSaber[1] == ItemState.USING)
			{
				sprite_index = spr_ZSaberHBSlashCharge;	
				maxTimmer = 3; 
				damage = 2;
			}
		}	break;
	}
	
	setupState = false;
}