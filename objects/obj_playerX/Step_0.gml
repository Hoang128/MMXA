/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	if (atkSpriteTime > 0) atkSpriteTime -= DELTA_TIME;
	else 
	{
		scr_playerXChangeShotSprite(object_index, false);
		atkSpriteTime = 0;
		atkState = AttackState.A_NONE;
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		if (atkState < AttackState.A_STRICT_ATTACK)
		{
			if (keyboard_check_pressed(global.keyAtk))
			{
				scr_playerXChangeShotSprite(object_index, true);
				atkSpriteTime = atkSpriteTimeMax;
				atkState = AttackState.A_NORMAL_ATTACK;
			}
		}
	}
}