/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (setupState)
{
	switch (state)
	{
		case SaberState.SABER_COMBO_1:			{ sprite_index = spr_ZSaberCombo1;			createDamageTime = 1; }		break;
		case SaberState.SABER_COMBO_2:			{ sprite_index = spr_ZSaberCombo2;			createDamageTime = 2; }		break;
		case SaberState.SABER_COMBO_3:			{ sprite_index = spr_ZSaberCombo3;			createDamageTime = 4; }		break;
		case SaberState.SABER_JUMP_SLASH:		{ sprite_index = spr_ZSaberSlashJump;		createDamageTime = 4; }		break;
		case SaberState.SABER_LAND_SLASH:		{ sprite_index = spr_ZSaberSlashLand;		createDamageTime = 4; }		break;
		case SaberState.SABER_DUCK_SLASH:		{ sprite_index = spr_ZSaberSlashDuck;		createDamageTime = 2; }		break;
		case SaberState.SABER_SPIN_SLASH:		{ sprite_index = spr_ZSaberSlashSpin;		createDamageTime = 4; }		break;
		case SaberState.SABER_SLIDE_SLASH:		{ sprite_index = spr_ZSaberSlashSlide;		createDamageTime = 2; }		break;
		case SaberState.SABER_CLIMB_SLASH:		{ sprite_index = spr_ZSaberSlashClimb;		createDamageTime = 2; }		break;
	}
	
	timmer = maxTimmer;
	setupState = false;
}