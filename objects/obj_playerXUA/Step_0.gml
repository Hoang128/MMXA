/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

//Passive all
if (resetBusterOnRowMax > 0)
	resetBusterOnRowMax -= DELTA_TIME;
else
{
	if (busterOnRow < busterOnRowMax && busterOnRow > 0)
	{
		busterOnRow = 0;
	}
}
if (waitShot > 0)
	waitShot -= DELTA_TIME;
else
{
	waitShot = 0;
	if (busterOnRow == busterOnRowMax)
		busterOnRow = 0;
}

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	if (atkSpriteTime > 0) atkSpriteTime -= DELTA_TIME;
	else 
	{
		if (inShotFrame == true)
		{
			if (sprite_index != spr_XUAStandCShot && sprite_index != spr_XUADuckCShot)
				scr_playerXChangeShotSprite(object_index, false, false);
			atkSpriteTime = 0;
		}
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		///Action script
		
		//Special Moves--------------------------------------------------------------------------------------------
		//Vertical Dash
		if (UN_DashFlag == true)
		{
			if (vState != VerticalState.V_ON_GROUND)
			{
				if (aState != ActionState.JUMPDASHING)
				{
					if (canAirDash == true)
					{
						sprite_index = sprDashUp1;
						image_index = 0;
					
						dashPhase = 1;
						dashSpd = dashUpSpdPhase1;
						dashTime = maxDashUpTime;
						hspd = 0;
						vDashDir = -1;
						if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						vState = VerticalState.V_MOVE_UP;
						hState = VerticalState.V_MOVE_NONE;
						aState = ActionState.DASHING;
						canAirDash = 0;
					}
				}
			}
			UN_DashFlag = false;
		}
		
		//Attack---------------------------------------------------------------------------------------------------
		//Normal attack
		#region
		
		scr_playerXNormalAttack(object_index);
		
		#endregion
	}
}