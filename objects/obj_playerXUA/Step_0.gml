/// @description Insert description here
// You can write your code in this editor

//Hp
scr_playerDeath(self.object_index);

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
	
	//Impact Attack
	#region
	
	if (sprite_index == sprImpactAtk)
	{
		if (impactAtkTime > 0)
			impactAtkTime -= DELTA_TIME;
		else
		{
			aState = ActionState.IDLE;
			if (activateState == ActivateState.HALF_ACTIVATE)
				activateState = ActivateState.ACTIVATE;
			if (vState == VerticalState.V_ON_GROUND)
			{
				sprite_index = sprStand;
				image_index = 0;
			}
			else
			{
				sprite_index = sprJump4;
				image_index = 0;
				vState = VerticalState.V_MOVE_FALLING;
			}
			impactAtkTime = 0;
		}
	}
	
	#endregion
	
	//Hover
	if (canHover > 1)	
		canHover--;
	
	if (aState == ActionState.HOVER)
	{
		if (hoverTime > 0)
		{
			hoverTime -= DELTA_TIME;
		}
		else
		{
			sprite_index = sprJump4;
			image_index = 0;
			
			canChangeHDir = true;
			hState = HorizontalState.H_MOVE_NONE;
			vState = VerticalState.V_MOVE_FALLING;
			aState = ActionState.IDLE;
			hspd = 0;
			vspd = 0;
			hoverTime = 0;
		}
	}
	
	if ((aState == ActionState.SLIDING) || (vState == VerticalState.V_ON_GROUND) || (aState == ActionState.CLIMBING) || (aState == ActionState.WIRING))
	{
		if (canHover <= 0)
		{
			canChangeHDir = true;
			canHover = 1;
		}
	}
	
	//Armor
	scr_armorPointHandle();
	
	//Nova Strike
	if (sprite_index == spr_XUANovaStrike2)
	{
		if (novaTime > 0)
		{
			if (place_meeting(x + hDir, y, obj_block))
				novaTime = 0;
			else
				novaTime -= DELTA_TIME;
		}
		else
		{
			novaTime = 0;
			
			sprite_index = spr_XUANovaStrikeEnd;
			image_index = 0;
		
			hspd = novaStrikeEndHspd * hDir;
			vspd = novaStrikeEndVspd;
			hState = HorizontalState.H_MOVE_FORWARD;
			vState = VerticalState.V_MOVE_DOWN;
		}
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		///Action script
		
		//Special Moves--------------------------------------------------------------------------------------------
		#region
		
		//Vertical Dash
		#region
		
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
						hState = HorizontalState.H_MOVE_NONE;
						aState = ActionState.DASHING;
						canAirDash = 0;
					}
				}
			}
			UN_DashFlag = false;
		}
		
		#endregion
		
		//Hover
		#region
		
		if (keyboard_check_pressed(global.keyJump))
		{
			
			if ((aState != ActionState.HOVER) && (hoverTime == 0))
			{
				if (aState != ActionState.JUMPDASHING)
				{
					if (vState == VerticalState.V_MOVE_FALLING)
					{
						if (canAirDash)
						{
							if (vspd >= 0)
							{
								if (canHover == 1)
								{
									sprite_index = sprHover;
									image_index = 0;
									var objHover = instance_create_depth(x, y, depth + 1, obj_XHoverEff);
									objHover.core = self;
									
									canChangeHDir = false;
									canHover = 0;
									canAirDash = 0;
									hoverTime = hoverTimeMax;
									hspd = 0;
									vspd = 0;
									hState = HorizontalState.H_MOVE_NONE;
									vState = VerticalState.V_MOVE_NONE;
									aState = ActionState.HOVER;
								}
							}
						}
					}
				}
			}
			else
			{
				hoverTime = 0;
			}
		}
		
		if (aState == ActionState.HOVER)
		{
			var hMoveL = keyboard_check(global.keyLeft);
			var hMoveR = keyboard_check(global.keyRight);
		
			var hMove = hMoveR - hMoveL;
		
			if (hMove != 0)
			{
				if (hoverTime > (hoverTimeMax / 4))
					hoverTime = hoverTimeMax / 4;
				if (hMove == hDir)
				{
					if (sprite_index != sprHoverFw)
					{
						sprite_index = sprHoverFw;
						image_index = 0;
					}
				}
				if (hMove = -hDir)
				{
					if (sprite_index != sprHoverBw)
					{
						sprite_index = sprHoverBw;
						image_index = 0;
					}
				}
				hspd = hMove * hoverMoveSpd;
			}
			else
			{
				if (sprite_index != sprHover)
				{
					sprite_index = sprHover;
					hspd = 0;
				}
			}
		}
		
		#endregion
		
		#endregion
		
		
		//Attack---------------------------------------------------------------------------------------------------
		//Normal attack
		#region
		
		scr_XSwitchWeapon();
		
		scr_playerXNormalAttack(object_index);
		
		scr_playerXSpecialAttack(object_index);
		
		#endregion
		
		//Giga attack
		#region
		
		if (keyboard_check_pressed(global.keyGiga))
		{
			if (atkState < AttackState.A_STRICT_ATTACK)
			{
				if (ArmorPoint > 0)
				{
					if ((aState != ActionState.JUMPDASHING) && (canAirDash) && (canHover))
					{
						if (aState == ActionState.SLIDING)
							hDir *= -1;
						canGetDamage = false;
						canAirDash = 0;
						canHover = 0;
						dashTime = 0;
						dashSpd = 0;
						sprite_index = spr_XUANovaStrike1;
						image_index = 0;
						hspd = novaStrikeStartHspd * hDir;
						vspd = novaStrikeStartVspd;
						hState = HorizontalState.H_MOVE_NONE;
						vState = VerticalState.V_MOVE_UP;
						atkState = AttackState.A_STRICT_ATTACK_LV4;
						aState = ActionState.SP_MOVE;
						ArmorPoint--;
					}
				}
			}
		}
		
		#endregion
	}
}