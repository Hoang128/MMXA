/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (setupState)
{
	switch (state)
	{
		case SaberState.SABER_COMBO_1: sprite_index = spr_ZSaberCombo1; break;
		case SaberState.SABER_COMBO_2: sprite_index = spr_ZSaberCombo2; break;
		case SaberState.SABER_COMBO_3: sprite_index = spr_ZSaberCombo3; break;
	}
	setupState = false;
}