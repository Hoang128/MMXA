/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (sprite_index == spr_ZDoubleJump)
{
	sprite_index = sprJump4;
	image_index = 0;
}

if (sprite_index == spr_ZSlashEnd_G)
{	
	if (atkState != AttackState.A_NONE)
		atkState = AttackState.A_NONE;
	
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == spr_ZSlashCombo1
 || sprite_index == spr_ZSlashCombo2
 || sprite_index == spr_ZSlashCombo3)
{
	standCombo = 0;
	if (atkState < AttackState.A_STRICT_ATTACK_LV2)
		atkState = AttackState.A_NONE;
	
	sprite_index = spr_ZSlashEnd_G;
	image_index = 0;
}