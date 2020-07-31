/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

//Collision with enemies when dash
var activeDashEff = false;
if (aState == ActionState.DASHING)
{
	if (usedFArmorPointFlag == true)
	{
		if (other.bullet == 0)
		{
			//Dash right
			#region
			
			if (hDir == 1)
			{
				if (vDashDir == 0)
				{
					if (collision_rectangle(bbox_right - 16, bbox_top, bbox_right, bbox_bottom, other, false, false))
					{
						canBeHit = false;
						activeDashEff = true;
					}
				}
			
				else if (vDashDir == 1)
				{
					if (collision_rectangle(bbox_right, bbox_top + 8, bbox_left + 8, bbox_bottom, other, false, false))
					{
						canBeHit = false;
						activeDashEff = true;
					}
				}
			
				else if (vDashDir == -1)
				{
					if (collision_rectangle(bbox_right, bbox_top, bbox_left + 8, bbox_bottom - 8, other, false, false))
					{
						canBeHit = false;
						activeDashEff = true;
					}
				}
			}
			
			#endregion
			
			//Dash left
			#region
			
			else if (hDir == -1)
			{
				if (vDashDir == 0)
				{
					if (collision_rectangle(bbox_left, bbox_top, bbox_left + 8, bbox_bottom, other, false, false))
					{
						canBeHit = false;
						activeDashEff = true;
					}
				}
			
				else if (vDashDir == 1)
				{
					if (collision_rectangle(bbox_left, bbox_top + 8, bbox_right - 8, bbox_bottom, other, false, false))
					{
						canBeHit = false;
						activeDashEff = true;
					}
				}
			
				else if (vDashDir == -1)
				{
					if (collision_rectangle(bbox_left, bbox_top, bbox_right - 8, bbox_bottom - 8, other, false, false))
					{
						canBeHit = false;
						activeDashEff = true;
					}
				}
			}
			
			#endregion
		}
	}
}

if (activeDashEff == true)
{
	if (sprite_index != spr_XEJumpBack1)
	{
		if (activateState == ActivateState.ACTIVATE)
		{
			sprite_index = spr_XEJumpBack1;
			image_index = 0;
			
			hspd = -2 * hDir;
			vspd = -3;
			dashSpd = 0;
			dashTime = 0;
			inAir = InAir.LIGHT_BOOST;
			activateState = ActivateState.HALF_ACTIVATE;
			aState = ActionState.SP_MOVE;
			hState = HorizontalState.H_MOVE_NONE;
			vState = VerticalState.V_MOVE_FALLING;
		}
	}
}

if (canBeHit == true)
	event_inherited();