/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (sprite_index == spr_XCShotStand)
{
	sprite_index = spr_XStand;
	image_index = 0;
	atkState = AttackState.A_NONE;
	scr_playerXChangeShotSprite(object_index, false, true);
}

if (sprite_index == spr_XCShotDuck)
{
	sprite_index = spr_XDuck2;
	image_index = 0;
	atkState = AttackState.A_NONE;
	scr_playerXChangeShotSprite(object_index, false, true);
}