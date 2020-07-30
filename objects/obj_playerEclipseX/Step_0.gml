/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************************************************************
	
	//ArmorFlags---------------------------------------------------------------------------------------------------------------------------------------------------
	switch (partFoot)
	{
		//Normal Foot
		case 0:
		{
			UN_DashKeyEnable = false;
			UF_DashKeyEnable = false;
			DN_DashKeyEnable = false;
			DF_DashKeyEnable = false;

			UN_JumpKeyEnable = false;
			UF_JumpKeyEnable = false;
			DN_JumpKeyEnable = false;
			DF_JumpKeyEnable = false;
		}	break;
		
		//Solar Foot
		case 1:
		{
			UN_DashKeyEnable = true;
			UF_DashKeyEnable = false;
			DN_DashKeyEnable = true;
			DF_DashKeyEnable = false;

			UN_JumpKeyEnable = false;
			UF_JumpKeyEnable = false;
			DN_JumpKeyEnable = false;
			DF_JumpKeyEnable = false;
		}	break;
		
		//Lunar Foot
		case 2:
		{
			UN_DashKeyEnable = false;
			UF_DashKeyEnable = false;
			DN_DashKeyEnable = false;
			DF_DashKeyEnable = false;

			UN_JumpKeyEnable = false;
			UF_JumpKeyEnable = false;
			DN_JumpKeyEnable = false;
			DF_JumpKeyEnable = false;
		}	break;
	}
	
	//Armor Points-------------------------------------------------------------------------------------------------------------------------------------------------
	scr_armorPointHandle();
	
	//Solar Passive------------------------------------------------------------------------------------------------------------------------------------------------
	//Foot Effects
	#region
	
	if (partFoot == 1)
	{
		if (((sprite_index == sprDash1) || (sprite_index == sprDashCrossDown1) || (sprite_index == sprDashKick1)) && (aState == ActionState.DASHING))
		{
			if (ArmorPoint > 0)
			{
				if (canUseArmorPoint == true)
				{
					if !((vState == VerticalState.V_ON_GROUND) && (vDashDir == 0))
					{
						if (usedFArmorPointFlag == false)
						{
							ArmorPoint--;
							dashTime = maxAirDashTime * 1.5;
							if (ArmorPoint > 0)
							{
								if (canAirDash == 0)
									canAirDash = 1;
							}	
							usedFArmorPointFlag = true;
						}
					}
				}
			}
		}
	
		if (aState != ActionState.DASHING)
		{
			if (vDashDir != 0)
				vDashDir = 0;
			if (usedFArmorPointFlag == true)
				usedFArmorPointFlag = false;
		}
	}
		
	#endregion
	
	//Active*******************************************************************************************************************************************************
	//Solar Active-------------------------------------------------------------------------------------------------------------------------------------------------
	if (partFoot == 1)
	{
		#region
		
		if (UN_DashFlag == true)
		{
			if (aState != ActionState.JUMPDASHING)
			{
				if (canAirDash == 1)
				{
					sprite_index = sprDashKick1;
					image_index = 1;
					
					dashPhase = 1;
					dashSpd = dashCrossSpd1;
					dashTime = maxAirDashTime;
					crossDashAngle = 45;
					vDashDir = -1;
					if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
					vState = VerticalState.V_MOVE_UP;
					hState = HorizontalState.H_MOVE_FORWARD;
					aState = ActionState.DASHING;
					canAirDash = 0;
				}
			}
			UN_DashFlag = false;
		}
		
		if (DN_DashFlag == true)
		{
			if ((aState != ActionState.JUMPDASHING) && (vState != VerticalState.V_ON_GROUND))
			{
				if (canAirDash == 1)
				{
					sprite_index = sprDashCrossDown1;
					image_index = 0;
					
					dashPhase = 1;
					dashSpd = dashCrossSpd1;
					dashTime = maxAirDashTime;
					crossDashAngle = 45;
					vDashDir = 1;
					if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
					vState = VerticalState.V_MOVE_UP;
					hState = HorizontalState.H_MOVE_FORWARD;
					aState = ActionState.DASHING;
					canAirDash = 0;
				}
			}
			DN_DashFlag = false;
		}
		
		#endregion
	}
}