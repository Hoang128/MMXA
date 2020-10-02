/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************************************************************
	//Normal Flags-------------------------------------------------------------------------------------------------------------------------------------------------
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
	
	//Armor Flags--------------------------------------------------------------------------------------------------------------------------------------------------
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
		//Impact count down
		if (sprite_index == spr_XEImpactDown)
		{
			if (timeInImpactDown > 0)
				timeInImpactDown -= DELTA_TIME;
			else
				timeInImpactDown = 0;
		}
		
		//Active ignite dash
		if (((sprite_index == sprDash1) || (sprite_index == sprDashCrossDown1) || (sprite_index == sprDashKick1)) && (aState == ActionState.DASHING))
		{
			if (ArmorPoint > 0)
			{
				if (canUseArmorPoint == true)
				{
					if !((vState == VerticalState.V_ON_GROUND) && (vDashDir == 0))
					{
						if (dashed == false)
						{
							if (usedFirstAirDash == true)
							{
								if (usedFArmorPointFlag == false)
								{
									solarDashTime--;
									ArmorPoint--;
									usedFArmorPointFlag = true;
								}
							}
							else
							{
								usedFirstAirDash = true;
							}
							if (ArmorPoint > 0)
							{
								if (canAirDash == 0)
								{
									if (solarDashTime != 0)
										canAirDash = 1;
								}
							}	
							dashed = true;
						}
					}
				}
			}
		}
		
		//Disable flags
		if (aState != ActionState.DASHING)
		{
			if ((vState == VerticalState.V_ON_GROUND) || (aState == ActionState.SLIDING) || (aState == ActionState.WIRING))
			{
				if (solarDashTime < maxSolarDashTime)
					solarDashTime = maxSolarDashTime;
				if (usedFirstAirDash == true)
					usedFirstAirDash = false;
			}
			if (dashed)
				dashed = false;
			if (isCrossDashing)
				isCrossDashing = false;
			if (vDashDir != 0)
				vDashDir = 0;
			if (usedFArmorPointFlag == true)
				usedFArmorPointFlag = false;
		}
	}
		
	#endregion
	
	//Arms Effects
	#region
	
	if (place_meeting(x, y + 1, obj_block) || (place_meeting(x, y + 1, dynamicBlock) && dynamicBlock.solid == 1))
	{
		//Charge shot 1
		if (sprite_index == spr_XEDoubleShot1_A)
		{
			sprite_index = spr_XEDoubleShot1_G;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
		
		//Charge shot 2
		if (sprite_index == spr_XEDoubleShot2_A)
		{
			sprite_index = spr_XEDoubleShot2_G;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
	}
	
	if ((sprite_index == spr_XEDoubleShot1_G) || (sprite_index == spr_XEDoubleShot1_A))
	{
		if ((image_index >= 2) && (image_index <= 3))
		{
			if (createSolarChargeEff == false)
			{
				audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
				if (chargeStack == 2)
					var obj = obj_ShotEffSolarBusterC1;
				else if (chargeStack == 3)
					var obj = obj_ShotEffSolarBusterC2;
				var objSolarChargeEff = instance_create_depth(x, y, depth - 10, obj);
				objSolarChargeEff.core = self;
				createSolarChargeEff = true;
			}
		}
	}
	
	if ((sprite_index == spr_XEDoubleShot2_G) || (sprite_index == spr_XEDoubleShot2_A))
	{
		if ((image_index >= 2) && (image_index <= 3))
		{
			if (createSolarChargeEff == false)
			{
				audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
				if (chargeStack == 2)
					var obj = obj_ShotEffSolarBusterC2;
				else if (chargeStack == 3)
					var obj = obj_ShotEffSolarBusterC3;
				var objSolarChargeEff = instance_create_depth(x, y, depth - 10, obj);
				objSolarChargeEff.core = self;
				createSolarChargeEff = true;
				chargeNormal = 0;
				chargeStack = 0;
			}
		}
	}
	
	#endregion
	
	//Active*******************************************************************************************************************************************************
	//Solar Active-------------------------------------------------------------------------------------------------------------------------------------------------
	if (partFoot == 1)
	{
		#region
		
		//Cross Dash
		#region
		
		if (UN_DashFlag == true)
		{
			if (aState != ActionState.JUMPDASHING)
			{
				if (canAirDash == 1)
				{
					if (solarDashTime > 0)
					{
						scr_playerXChangeShotSprite(object_index, false ,false);
						sprite_index = sprDashKick1;
						image_index = 1;
					
						dashPhase = 1;
						dashSpd = dashSpdPhase1;
						dashTime = maxAirDashTime;
						crossDashAngle = 45;
						vDashDir = -1;
						isCrossDashing = true;
						if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						vState = VerticalState.V_MOVE_UP;
						hState = HorizontalState.H_MOVE_FORWARD;
						aState = ActionState.DASHING;
						canAirDash = 0;
					}
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
					if (solarDashTime > 0)
					{
						scr_playerXChangeShotSprite(object_index, false ,false);
						sprite_index = sprDashCrossDown1;
						image_index = 0;
					
						dashPhase = 1;
						dashSpd = dashSpdPhase1;
						dashTime = maxAirDashTime;
						crossDashAngle = 45;
						vDashDir = 1;
						isCrossDashing = true;
						if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						vState = VerticalState.V_MOVE_UP;
						hState = HorizontalState.H_MOVE_FORWARD;
						aState = ActionState.DASHING;
						canAirDash = 0;
					}
				}
			}
			DN_DashFlag = false;
		}
		
		#endregion
		
		//Impact down
		#region
		
		if (sprite_index == spr_XESlamDown)
		{
			if (aState == ActionState.SP_MOVE)
			{
				if (place_meeting(x, y + 1, obj_block) || (place_meeting(x, y + 1, dynamicBlock) && dynamicBlock.solid == 1))
				{
					sprite_index = spr_XEImpactDown;
					image_index = 0;
					
					scr_SetQuake(15);
					instance_create_depth(x, bbox_bottom, depth - 1, obj_solarSlamDownEff);
					
					audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
					audio_play_sound_on(global.SFX_Emitter, snd_XSlamDown, false, false);
					
					var obj1 = instance_create_depth(x + 16, bbox_bottom + 2, depth - 1, obj_sideDust);
					obj1.image_xscale = -1;
					
					var obj1 = instance_create_depth(x - 16, bbox_bottom + 2, depth - 1, obj_sideDust);
					obj1.image_xscale = 1;
					
					timeInImpactDown = minTimeInImpactDown;
					vState = VerticalState.V_ON_GROUND;
				}
				else
				{
					var hMove = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
					
					if (hMove != 0)
						hDir = hMove;
				}
			}
		}
		
		#endregion
		
		#endregion
	}
	
	if (activateState == ActivateState.ACTIVATE)
	{
		if (partFoot == 1)
		{	
			//Slam down
			#region
		
			if (keyboard_check_pressed(global.keyJump) && keyboard_check(global.keyDown))
			{
				if (canUseJumpButton == 1)
				{
					if ((vState != VerticalState.V_ON_GROUND) && (aState != ActionState.SP_MOVE))
					{
						scr_playerXChangeShotSprite(object_index, false ,false);
						sprite_index = spr_XESlamDown;
						image_index = 0;
						
						if (ArmorPoint > 0)
						{
							var objSolarDashDmgEff = instance_create_depth(x + 2 * image_xscale, bbox_bottom + 4, depth - 1, obj_solarDashDamageEff);
							objSolarDashDmgEff.core = self;
							objSolarDashDmgEff.xPlace = 2;
							objSolarDashDmgEff.yPlace = bbox_bottom + 4 - y;
							objSolarDashDmgEff.depth = depth - 15;
							objSolarDashDmgEff.image_angle = 270;
						}
						var objSolarDashImpactEff = instance_create_depth(x, bbox_bottom + 16, depth - 1, obj_solarDashImpactEff);
						objSolarDashImpactEff.depth = depth - 10;
						objSolarDashImpactEff.image_angle = 270;
					
						audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
					
						dashSpd = 0;
						dashTime = 0;
						hspd = 0;
						vspd = 6;
						vDashDir = 1;
						if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						vState = VerticalState.V_MOVE_DOWN;
						hState = HorizontalState.H_MOVE_NONE;
						aState = ActionState.SP_MOVE;
					}
				}
			}
			
			if (sprite_index == spr_XEImpactDown)
			{
				if (timeInImpactDown == 0)
				{
					if (!keyboard_check(global.keyDown) || (ArmorPoint == ArmorPointMax))
					{
						sprite_index = sprStand;
						image_index = 0;
						
						coolDownAPTime = coolDownAPTimeMax;
						
						aState = ActionState.IDLE;
					}
				}
			}
			
			#endregion
		}
	}
}