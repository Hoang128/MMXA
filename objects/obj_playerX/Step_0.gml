/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	if (atkSpriteTime > 0) atkSpriteTime--;
	else atkState = AttackState.A_NONE;
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		if (atkState == AttackState.A_NONE)
		{
			if (keyboard_check_pressed(global.keyAtk))
			{
				atkSpriteTime = atkSpriteTimeMax;
				atkState = AttackState.A_NORMAL_ATTACK;
			}
		}
	}
}