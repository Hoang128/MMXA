/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case spr_XCShotStand:
	{
		sprite_index = spr_XStand;
		image_index = 0;
		atkState = AttackState.A_NONE;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;

	case spr_XCShotDuck:
	{
		sprite_index = spr_XDuck2;
		image_index = 0;
		atkState = AttackState.A_NONE;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;

	case spr_XShotClimb:
	{
		sprite_index = spr_XClimb;
		image_index = 4;
		atkState = AttackState.A_NONE;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;
}