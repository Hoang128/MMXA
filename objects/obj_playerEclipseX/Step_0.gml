/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive*************************************************************************************
	
	//Armor Points
	scr_armorPointHandle();
	
	//Solar Passive-------------------------------------------------------------------------------
	//Foot Effects
	#region
	
	if (sprite_index == sprDash1)
	{
		if (ArmorPoint > 0)
		{
			if (canUseArmorPoint == true)
			{
				if (vState != VerticalState.V_ON_GROUND)
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
		if (usedFArmorPointFlag == true)
			usedFArmorPointFlag = false;
	}
		
	#endregion
}