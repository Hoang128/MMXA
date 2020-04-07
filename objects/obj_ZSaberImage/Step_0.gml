/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (setupState)
{
	switch (state)
	{
		case SaberState.SABER_COMBO_1:			{ sprite_index = spr_ZSaberCombo1;		maxTimmer = 9; }	break;
		case SaberState.SABER_COMBO_2:			{ sprite_index = spr_ZSaberCombo2;		maxTimmer = 7; }	break;
		case SaberState.SABER_COMBO_3:			{ sprite_index = spr_ZSaberCombo3;		maxTimmer = 4; }	break;
		case SaberState.SABER_JUMP_SLASH:		{ sprite_index = spr_ZSaberSlashJump;	maxTimmer = 1; }	break;
		case SaberState.SABER_LAND_SLASH:		{ sprite_index = spr_ZSaberSlashLand;	maxTimmer = 1; }	break;
		case SaberState.SABER_DUCK_SLASH:		{ sprite_index = spr_ZSaberSlashDuck;	maxTimmer = 9; }	break;
		case SaberState.SABER_SPIN_SLASH:		{ sprite_index = spr_ZSaberSlashSpin;	maxTimmer = 2; }	break;
		case SaberState.SABER_SLIDE_SLASH:		{ sprite_index = spr_ZSaberSlashSlide;	maxTimmer = 4; }	break;
		case SaberState.SABER_CLIMB_SLASH:		{ sprite_index = spr_ZSaberSlashClimb;	maxTimmer = 4; }	break;
		case SaberState.SABER_CHARGE_SLASH:		
		{ 
			if (global.zSaber[1] == ItemState.USING)
			{
				sprite_index = spr_ZSaberSlashCharge_Smash;	
			}
		}	break;
	}
	
	setupState = false;
}