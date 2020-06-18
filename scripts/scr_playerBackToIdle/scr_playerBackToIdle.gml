with(obj_playerHumanForm)
{
	aState = ActionState.IDLE;
	hState = HorizontalState.H_MOVE_NONE;
	if (vState != VerticalState.V_ON_GROUND)
	{
		sprite_index = sprJump3;
		image_index = 0;
		vState = VerticalState.V_MOVE_FALLING;
	}
	else
	{
		if (sprite_index == sprDash1 || sprite_index == sprDash2)
		{
			sprite_index = sprDash3;
			image_index = 0;
		}
		if (sprite_index == sprRun)
		{
			sprite_index = sprRunEnd;
			image_index = 0;
		}		
	}
	
	hspd = 0;
	atkState = AttackState.A_NONE;
	dashTime = 0;
	dashSpd = 0;
	activateState = ActivateState.HALF_ACTIVATE;
	
	keyboard_key_release(global.keyLeft);
	keyboard_key_release(global.keyRight);
}