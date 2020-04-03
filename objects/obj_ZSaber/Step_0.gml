/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (setupState)
{
	switch (state)
	{
		case SaberState.SABER_COMBO_1:			sprite_index = spr_ZSaberCombo1; break;
		case SaberState.SABER_COMBO_2:			sprite_index = spr_ZSaberCombo2; break;
		case SaberState.SABER_COMBO_3:			sprite_index = spr_ZSaberCombo3; break;
		case SaberState.SABER_JUMP_SLASH:		sprite_index = spr_ZSaberSlashJump; break;
		case SaberState.SABER_LAND_SLASH:		sprite_index = spr_ZSaberSlashLand; break;
		case SaberState.SABER_DUCK_SLASH:		sprite_index = spr_ZSaberSlashDuck; break;
		case SaberState.SABER_SPIN_SLASH:		sprite_index = spr_ZSaberSlashSpin; break;
		case SaberState.SABER_SLIDE_SLASH:		sprite_index = spr_ZSaberSlashSlide; break;
		case SaberState.SABER_CLIMB_SLASH:		sprite_index = spr_ZSaberSlashClimb; break;
	}
	setupState = false;
}