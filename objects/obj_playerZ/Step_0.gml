/// @description Zero's Actions
// You can write your code in this editor

//Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	#region
	
	//Key
	#region
	
	if (keyboard_check_released(global.keyGiga))
	{
		if (aState == ActionState.STUNNING)
		{
			if (chargeCore > 0)
			{
				chargeCore = 0;
			}
		}
	}
	
	#endregion
	
	//Air hike
	#region
	
	if ((vState == VerticalState.V_ON_GROUND) || (aState == ActionState.WIRING) || (aState == ActionState.CLIMBING) || (aState == ActionState.SLIDING))
	{
		airHikeTime = airHikeTimeMax;
	}
	
	if (canAirDash == 0) airHikeTime = 0;
	
	#endregion

	//Charge slash earth quake
	#region
	
	if (sprite_index == spr_ZSlashCharge_G)
	{
		if ((image_index >= 7) && (image_index <= 10))
		{
			if (global.zSaber[1] == ItemState.USING)
			{
				if (!scr_isQuake())
					scr_SetQuake(15);
			}
		}
	}
	
	#endregion
	
	//Change attack sprite from jump to land
	#region
	if (place_meeting(x, y + 1, obj_block) || (place_meeting(x, y + 1, dynamicBlock) && dynamicBlock.solid == 1))
	{
		//Jump slash
		if (sprite_index == spr_ZSlashJump)
		{
			sprite_index = spr_ZSlashLand;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			atkState = AttackState.A_STRICT_ATTACK_LV2;
			hspd = 0;
			hState = AttackState.A_NONE;
			scr_MeeleWeaponChangeState(obj_ZSaberImage, SaberState.SABER_LAND_SLASH);
		}
		
		//Spin slash
		if (sprite_index == spr_ZSlashSpin)
		{
			sprite_index = sprLand;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			atkState = AttackState.A_NONE;
			hspd = 0;
			hState = AttackState.A_NONE;
			scr_MeeleWeaponDestroy(obj_ZSaberImage);
		}
		
		//Charge slash
		if (sprite_index == spr_ZSlashCharge_A)
		{
			sprite_index = spr_ZSlashCharge_G;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV4;
		}
		
		//Shot
		if (sprite_index == spr_ZShotNorA)
		{
			sprite_index = spr_ZShotNorG;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
		
		//Charge shot 1
		if (sprite_index == spr_ZShotC1_A)
		{
			sprite_index = spr_ZShotC1_G;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
		
		//Charge shot 2
		if (sprite_index == spr_ZShotC2_A)
		{
			sprite_index = spr_ZShotC2_G;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
		
		//Charge shot 3
		if (sprite_index == spr_ZShotC3_A)
		{
			sprite_index = spr_ZShotC3_G;
			
			audio_play_sound_on(global.SFX_Emitter, sndLandEff, false, false);
			
			scr_SetIceSlideSpd(hspd, true);
			
			scr_MeeleWeaponChangeState(obj_ZSaberImage, SaberState.SABER_CHARGE_COMBO_G);
			
			hspd = 0;
			hState = AttackState.A_NONE;
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
	}
	
	#endregion
	
	//Slash timmer
	#region
	
	if (canSlash < 1) 
	{
		if (atkState == AttackState.A_NONE) canSlash = 1;
		canSlash += DELTA_TIME;
	}
	
	//Slash combo 2
	if ((standCombo > 0) && (atkState != AttackState.A_STRICT_ATTACK_LV2)) standCombo = 0;
	
	if ((sprite_index == spr_ZSlashCombo1) && (image_index > 8))
	{
		if (standCombo > 1)
		{
			sprite_index = spr_ZSlashCombo2;
			image_index = 0;
			audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
			audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
			
			if (instance_exists(obj_ZSaber)) 
			{
				scr_MeeleWeaponChangeState(obj_ZSaberImage, SaberState.SABER_COMBO_2);
			}
		}
	}
	
	//Slash combo 3
	if ((sprite_index == spr_ZSlashCombo2) && (image_index > 6))
	{
		if (standCombo > 2)
		{
			sprite_index = spr_ZSlashCombo3;
			image_index = 0;
			audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo3, 0, 0);
			audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash3, 0, 0);
			
			if (instance_exists(obj_ZSaber)) 
			{
				scr_MeeleWeaponChangeState(obj_ZSaberImage, SaberState.SABER_COMBO_3);
			}
			atkState = AttackState.A_STRICT_ATTACK_LV3;
		}
	}
	
	#endregion
	
	//Buster
	#region
	
	//Normal shot
	if ((sprite_index == spr_ZShotNorG) || (sprite_index == spr_ZShotNorA))
	{
		if ((image_index > 4) && (image_index < 5))
		{
			if (busterType != noone)
			{
				if (!instance_exists(obj_ShotEffZBusterNor))
				{
					var xPlace;
					var yPlace;
					if (sprite_index == spr_ZShotNorG)
					{
						xPlace = 24;
						yPlace = -22;
					}
					if (sprite_index == spr_ZShotNorA)
					{
						xPlace = 30;
						yPlace = -24;
					}
					var shotEff = instance_create_depth(x + xPlace * image_xscale, y + yPlace, depth - 1, obj_ShotEffZBusterNor);
					shotEff.image_xscale = image_xscale;
					shotEff.busterType = busterType
					shotEff.core = self;
					if (busterType == obj_ZThunderBlaster)
					{
						sprite_index = spr_ZShotHoldThunderBlaster;
						image_index = 0;
					}
					else
						busterType = noone;
				}
			}
		}
	}
	
	if (sprite_index == spr_ZShotC1_G || sprite_index == spr_ZShotC1_A)
	{
		if (image_index >= 3 && image_index <= 4)
		{
			if (!instance_exists(obj_ShotEffZBusterCharge))
			{
				var xPlace;
				var yPlace;
				if (sprite_index == spr_ZShotC1_G)
				{
					xPlace = 48;
					yPlace = -19;
				}
				if (sprite_index == spr_ZShotC1_A)
				{
					xPlace = 35;
					yPlace = -26;
				}
				var shotEff = instance_create_depth(x + xPlace * image_xscale, y + yPlace, depth - 1, obj_ShotEffZBusterCharge);
				shotEff.image_xscale = image_xscale;
				shotEff.busterType = busterType;
				shotEff.core = self;
				busterType = noone;
			}
		}
	}
	
	if (sprite_index == spr_ZShotC2_G || sprite_index == spr_ZShotC2_A)
	{
		if (image_index >= 3 && image_index <= 4)
		{
			if (!instance_exists(obj_ShotEffZBusterCharge))
			{
				var xPlace;
				var yPlace;
				if (sprite_index == spr_ZShotC2_G)
				{
					xPlace = 48;
					yPlace = -19;
				}
				if (sprite_index == spr_ZShotC2_A)
				{
					xPlace = 35;
					yPlace = -26;
				}
				var shotEff = instance_create_depth(x + xPlace * image_xscale, y + yPlace, depth - 1, obj_ShotEffZBusterCharge);
				shotEff.image_xscale = image_xscale;
				shotEff.busterType = busterType;
				shotEff.core = self;
				busterType = noone;
			}
		}
	}
	
	#endregion
	
	//Passive Counters
	
	//Ex-Skill
	#region
	
	if (sprite_index == spr_ZSlashUp)
	{
		if (upperSlashTime < upperSlashTimeMax)
		{
			chargeNormal = 0;
			if (image_index > 16)
				image_index = 4;
			if (image_index >= 4)
			{
				if (playSFXUpperSlash == false)
				{
					audio_play_sound_on(global.SFX_Emitter, snd_ZSkillIceEff, false, false);
					audio_play_sound_on(global.SFX_Emitter, snd_VZSlashUp, false, false);
					
					playSFXUpperSlash = true;
				}
				if (!keyboard_check(global.keyAtk))
				{
					upperSlashTime = upperSlashTimeMax;
				}
				if (upperSlashTime < (upperSlashTimeMax * upperSlashTimeH1R))
				{
					hspd = hDir * upperSlashHspd * (1 - upperSlashTime / (upperSlashTimeMax * upperSlashTimeH1R));
				}
				else
					hspd = 0;
				
				if (upperSlashTime < (upperSlashTimeMax * upperSlashTimeV1R))
				{
					vspd = upperSlashVspd2Start + (upperSlashVspd1Start - upperSlashVspd2Start)  * (1 - upperSlashTime / (upperSlashTimeMax * upperSlashTimeV1R));
				}
				
				else if (upperSlashTime < (upperSlashTimeMax * upperSlashTimeV2R))
				{
					vspd = upperSlashVspd2Start;
				}
				
				else
				{
					var ratio = 1 - (upperSlashTime * (1 - upperSlashTimeV1R - upperSlashTimeV2R)) / (upperSlashTimeMax * (1 - upperSlashTimeV1R - upperSlashTimeV2R));
					vspd = upperSlashVspd2Start * (ratio);
				}
				upperSlashTime += DELTA_TIME;
			}
			else if (image_index >= 3)
			{
				hspd = (image_index - 3) * upperSlashHspd;
				vspd = (image_index - 3) * upperSlashVspd1Start;
			}
		}
		else
		{
			if (image_index < 17)
			{
				hspd = 0;
				image_index = 17;
			}
		}
	}
	
	if (sprite_index == spr_ZSlashDash)
	{
		chargeNormal = 0;
		hspd = dashSpdPhase2 * (18 - image_index) / 18 * hDir;
		vspd = 0;
	}
	
	#endregion
	
	#endregion
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		//Normal attack	
		#region
		
		if (keyboard_check_pressed(global.keyAtk))
		{
			if (canSlash > 0)
			{
				//Tripple slash
				if (vState == VerticalState.V_ON_GROUND)
				{
					if ((aState == ActionState.IDLE) || (aState == ActionState.DASHING))
					{
						if ((USlashEnable == true) && (keyboard_check(global.keyUp) && !keyboard_check(global.keyDown) && (!keyFoward)))
						{
							cmdUSlashFlag = true;
							cmdDSlashFlag = false;
							cmdFSlashFlag = false;
							cmdThrustFlag = false;
						}
						if ((DSlashEnable == true) && (!keyboard_check(global.keyUp) && !keyboard_check(global.keyDown) && ((aState == ActionState.DASHING) && (sprite_index != sprDash3))))
						{
							cmdUSlashFlag = false;
							cmdDSlashFlag = true;
							cmdFSlashFlag = false;
							cmdThrustFlag = false;
						}
						if ((FSlashEnable == true) && (!keyboard_check(global.keyUp) && !keyboard_check(global.keyDown) && (keyFoward) && !((aState == ActionState.DASHING) && (sprite_index != sprDash3))))
						{
							cmdUSlashFlag = false;
							cmdDSlashFlag = false;
							cmdFSlashFlag = true;
							cmdThrustFlag = false;
						}
						if (cmdDSlashFlag == false && cmdFSlashFlag == false && cmdUSlashFlag == false)
						{
							if (sprite_index != sprLand)
							{
								if (standCombo < 3)
								{
									standCombo++;
								}
								aState = ActionState.IDLE;
					
								if (atkState == AttackState.A_NONE)
								{
									sprite_index = spr_ZSlashCombo1;
									image_index = 0;
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
									audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
								
									scr_SetIceSlideSpd(hspd, true);
								
									hspd = 0;
									if (dashSpd > 0)
									{
										dashSpd = 0;
										dashTime = 0;
									}
								
									atkState = AttackState.A_STRICT_ATTACK_LV2;
								
									scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_COMBO_1, self);
								}
							}
							else
							{
								if (atkState == AttackState.A_NONE)
								{
									sprite_index = spr_ZSlashLand;
									image_index = 0;
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
									audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
								
									scr_SetIceSlideSpd(hspd, true);
								
									hspd = 0;
									if (dashSpd > 0)
									{
										dashSpd = 0;
										dashTime = 0;
									}
								
									atkState = AttackState.A_STRICT_ATTACK_LV2;

									scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_LAND_SLASH, self);
								}
							}
						}
					}
					
					if (aState == ActionState.DUCKING)
					{
						if (atkState == AttackState.A_NONE)
						{
							sprite_index = spr_ZSlashDuck;
							image_index = 0;
							randomize();
							if (random(2) > 1.2)
								audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							atkState = AttackState.A_STRICT_ATTACK_LV2;
							
							scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_DUCK_SLASH, self);
						}
					}
				}
				
				//JumpSlash
				else if (vState == VerticalState.V_MOVE_FALLING)
				{
					if ((ThrustEnable == false) && (!keyboard_check(global.keyUp) && keyboard_check(global.keyDown)))
					{
						cmdUSlashFlag = false;
						cmdDSlashFlag = false;
						cmdFSlashFlag = false;
						cmdThrustFlag = true;
					}
					if (cmdDSlashFlag == false && cmdThrustFlag == false)
					{
						if ((sprite_index != spr_ZDoubleJump) && !keyboard_check(global.keyUp))
						{
							if (atkState == AttackState.A_NONE)
							{
								sprite_index = spr_ZSlashJump;
								image_index = 0;
								randomize();
								if (random(2) > 1.2)
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
							
								hspd = 0;
								atkState = AttackState.A_STRICT_ATTACK;
							
								scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_JUMP_SLASH, self);
							}
						}
						else
						{
							if (atkState == AttackState.A_NONE)
							{
								sprite_index = spr_ZSlashSpin;
								image_index = 0;
								randomize();
								if (random(2) > 1.2)
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
							
								hspd = 0;
								atkState = AttackState.A_STRICT_ATTACK;
							
								scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_SPIN_SLASH, self);
							}
						}
					}
				}
				
				//Slide & Climb Slash
				else
				{
					if (aState == ActionState.DASHING)
					{
						if ((DSlashEnable == true) && (!keyboard_check(global.keyUp) && !keyboard_check(global.keyDown) && (sprite_index != sprDash3)))
						{
							cmdUSlashFlag = false;
							cmdDSlashFlag = true;
							cmdFSlashFlag = false;
							cmdThrustFlag = false;
						}
					}
					
					//Slide Slash
					if (aState == ActionState.SLIDING)
					{
						if (sprite_index == sprSlide2)
						{
							if (atkState == AttackState.A_NONE)
							{
								sprite_index = spr_ZSlashSlide;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							
								hspd = 0;
								atkState = AttackState.A_NORMAL_ATTACK;
							
								scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_SLIDE_SLASH, self);
							}
						}
					}
					
					//Climb Slash
					if (aState == ActionState.CLIMBING)
					{
						if (sprite_index == sprClimb2)
						{
							if (atkState == AttackState.A_NONE)
							{
								sprite_index = spr_ZSlashClimb;
								image_index = 0;
								image_speed = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							
								vspd = 0;
								isClimbing = 0;
								vState = VerticalState.V_MOVE_NONE;
								atkState = AttackState.A_STRICT_ATTACK_LV2;
							
								scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_CLIMB_SLASH, self);
							}
						}
					}
					
					//Wire Slash
					if (aState == ActionState.WIRING)
					{
						if ((sprite_index != sprWiredStartH) && (sprite_index != sprWiredStartV) && (sprite_index != spr_ZSlashWired))
						{
							sprite_index = spr_ZSlashWired;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							
							vspd = 0;
							hspd = 0;
							if (dashSpd > 0)
							{
								dashSpd = 0;
								dashTime = 0;
							}
							vState = VerticalState.V_MOVE_NONE;
							hState = HorizontalState.H_MOVE_NONE;
							atkState = AttackState.A_STRICT_ATTACK_LV2;
							
							scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_WIRE_SLASH, self);
						}
					}
				}
				
				canSlash = -slashWaitTime;
			}
		}
		
		#endregion
		
		//Charge attack
		#region
		
		if (keyboard_check(global.keyAtk))
		{
			if ((chargeNormal >= 0) && (chargeNormal < chargeLv2Limit))
			{
				if (chargeCore == 0)
				{
					chargeNormal += DELTA_TIME;
					if (chargeNormal >= chargeLv1Limit)
					{
						if (!instance_exists(obj_ZChargeEffLv1))
						{
							var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_ZChargeEffLv1);
							objChargeEff.core = self;
							objChargeEff.chargeParameter = self.chargeNormal;
						}
					}
				}
				else
					chargeNormal = 0;
			}
			
			if (chargeNormal >= chargeLv2Limit)
			{
				if (!instance_exists(obj_ZChargeEffLv2))
				{
					var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_ZChargeEffLv2);
					objChargeEff.core = self;
					objChargeEff.chargeParameter = self.chargeNormal;
				}
			}
		}
		
		if (keyboard_check_released(global.keyAtk))
		{
			if (chargeNormal >= chargeLv1Limit)
			{
				if (instance_exists(obj_ZChargeEffLv1))
					instance_destroy(obj_ZChargeEffLv1);
			}
			if (chargeNormal >= chargeLv2Limit)
			{
				if (instance_exists(obj_ZChargeEffLv2))
					instance_destroy(obj_ZChargeEffLv2);
				
				if (vState == VerticalState.V_ON_GROUND)
				{
					sprite_index = spr_ZSlashCharge_G;
					
					scr_SetIceSlideSpd(hspd, true);
					
					hspd = 0;
					if (dashSpd > 0)
					{
						dashSpd = 0;
						dashTime = 0;
					}
								
					hState = HorizontalState.H_MOVE_NONE;
					atkState = AttackState.A_STRICT_ATTACK_LV4;
					
				}
				else
				{
					sprite_index = spr_ZSlashCharge_A;
					
					if (canAirDash)
						canAirDash = 0;
					if (aState != ActionState.JUMPDASHING)
						aState = ActionState.IDLE;
					atkState = AttackState.A_STRICT_ATTACK;
				}
				image_index = 0;
				audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo3, 0, 0);
				audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash3, 0, 0);

				vState = VerticalState.V_MOVE_FALLING;
				
				scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_CHARGE_SLASH, self);
			}
			chargeNormal = 0;
		}
		
		#endregion
		
		//Special attack
		#region
		
		//Saber
		#region
		
		if (cmdUSlashFlag == true)
		{
			if (sprite_index != spr_ZSlashUp)
			{
				sprite_index = spr_ZSlashUp;
				image_index = 0;
			
				if (instance_exists(obj_PlayerWeaponMeeleImage))
					scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
				scr_MeeleWeaponCreate(obj_ZIceSaberImage, noone, self);
			
				atkState = AttackState.A_STRICT_ATTACK_LV4;
				aState = ActionState.IDLE;
				vState = VerticalState.V_MOVE_UP;
				hState = HorizontalState.H_MOVE_FORWARD;
				canClimb = false;
				upperSlashTime = 0;
				playSFXUpperSlash = false;
				dashSpd = 0;
				dashTime = 0;
				vspd = 0;
				hspd = 0;
				cmdUSlashFlag = false;
			}
		}
		
		if (cmdDSlashFlag == true)
		{
			if (sprite_index != spr_ZSlashDash)
			{
				sprite_index = spr_ZSlashDash;
				image_index = 0;
				
				audio_play_sound_on(global.SFX_Emitter, snd_VZSlashUp, false ,false);
				
				if (instance_exists(obj_PlayerWeaponMeeleImage))
					scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
				scr_MeeleWeaponCreate(obj_ZFlameSaberImage, noone, self);
			
				atkState = AttackState.A_STRICT_ATTACK_LV4;
				aState = ActionState.IDLE;
				if (vState != VerticalState.V_ON_GROUND)
					vState = VerticalState.V_MOVE_NONE;
				hState = HorizontalState.H_MOVE_FORWARD;
				canClimb = false;
				dashSpd = 0;
				dashTime = 0;
				vspd = 0;
				hspd = dashSpdPhase2 * hDir;
				cmdDSlashFlag = false;
			}
		}
		
		#endregion
		
		//Buster
		#region
		
		if (keyboard_check_pressed(global.keySpAtk))
		{
			//Chrono Field
			if ((!keyboard_check(global.keyUp)) && (!keyboard_check(global.keyDown)))
			{
				if (!instance_exists(obj_ZChronoField))
				{
					if (vState == VerticalState.V_ON_GROUND)
					{
						if (atkState < AttackState.A_STRICT_ATTACK_LV3)
						{
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
							scr_MeeleWeaponDestroy(obj_ZSaberImage);
							sprite_index = spr_ZShotNorG;
							
							scr_SetIceSlideSpd(hspd, true);
							
							hspd = 0;
							if (dashSpd > 0)
							{
								dashSpd = 0;
								dashTime = 0;
							}
							aState = ActionState.IDLE;
							atkState = AttackState.A_STRICT_ATTACK_LV3;
							image_index = 0;
							busterType = obj_ZChronoField;
							if (instance_exists(obj_PlayerWeaponMeeleImage)) 
								scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
						}
					}
					else
					{
						if (atkState < AttackState.A_STRICT_ATTACK)
						{
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
							scr_MeeleWeaponDestroy(obj_ZSaberImage);
							sprite_index = spr_ZShotNorA;
						
							busterType = obj_ZBusterNor;
							if (aState != ActionState.JUMPDASHING)
								aState = ActionState.IDLE;
							atkState = AttackState.A_STRICT_ATTACK;
							vState = VerticalState.V_MOVE_FALLING;
							image_index = 0;
							busterType = obj_ZChronoField;
							if (instance_exists(obj_PlayerWeaponMeeleImage)) 
								scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
						}
					}
				}
			}
			
			//Thunder Blast
			if ((keyboard_check(global.keyUp)) && (!keyboard_check(global.keyDown)))
			{
				if (vState == VerticalState.V_ON_GROUND)
				{
					if (!instance_exists(obj_ZThunderBlaster))
					{
						if (atkState < AttackState.A_STRICT_ATTACK_LV3)
						{
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
							if (instance_exists(obj_PlayerWeaponMeeleImage)) 
								scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
							sprite_index = spr_ZShotNorG;
							
							scr_SetIceSlideSpd(hspd, true);
							
							hspd = 0;
							if (dashSpd > 0)
							{
								dashSpd = 0;
								dashTime = 0;
							}
							aState = ActionState.IDLE;
							atkState = AttackState.A_STRICT_ATTACK_LV3;
							image_index = 0;
							busterType = obj_ZThunderBlaster;
							if (instance_exists(obj_PlayerWeaponMeeleImage)) 
								scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
						}
					}
				}
			}
		}
		
		if (!keyboard_check(global.keySpAtk))
		{
			if (sprite_index == spr_ZShotHoldThunderBlaster && busterType = obj_ZThunderBlaster)
			{
				if ((instance_exists(obj_ZThunderBlaster)) && (obj_ZThunderBlaster.sprite_index == spr_ZThunderBlasterDamage))
				{
					busterType = noone;
					sprite_index = spr_ZShotNorG;
					image_index = 8;	
				}
			}
		}
		
		#endregion
		
		#endregion
		
		//Form attack
		#region
		
		if (keyboard_check_pressed(global.keyGiga))
		{
			if (global.zCore[2] == ItemState.USING)
			{
				//Z buster
				switch (chargeCore)
				{
					case 0:
					{
						if ((!keyboard_check(global.keyUp)) && (!keyboard_check(global.keyDown)))
						{
							if (vState == VerticalState.V_ON_GROUND)
							{
								if (atkState < AttackState.A_STRICT_ATTACK_LV3)
								{
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
									scr_MeeleWeaponDestroy(obj_ZSaberImage);
									sprite_index = spr_ZShotNorG;
							
									scr_SetIceSlideSpd(hspd, true);
							
									hspd = 0;
									if (dashSpd > 0)
									{
										dashSpd = 0;
										dashTime = 0;
									}
									aState = ActionState.IDLE;
									atkState = AttackState.A_STRICT_ATTACK_LV3;
									image_index = 0;
									busterType = obj_ZBusterNor;
								}
							}
							else
							{
								if (atkState < AttackState.A_STRICT_ATTACK)
								{
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
									scr_MeeleWeaponDestroy(obj_ZSaberImage);
									sprite_index = spr_ZShotNorA;
						
									busterType = obj_ZBusterNor;
									if (aState != ActionState.JUMPDASHING)
										aState = ActionState.IDLE;
									atkState = AttackState.A_STRICT_ATTACK;
									vState = VerticalState.V_MOVE_FALLING;
									image_index = 0;
									busterType = obj_ZBusterNor;
								}
							}
						}
					}	break;
					
					case -3:
					{
						if (vState == VerticalState.V_ON_GROUND)
						{
							if ((sprite_index != spr_ZShotC2_G) || (sprite_index == spr_ZShotC2_G && image_index > 7))
							{
								sprite_index = spr_ZShotC3_G;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZShotC3, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash3, 0, 0);
								
								scr_MeeleWeaponDestroy(obj_ZSaberImage);
								
								scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_CHARGE_COMBO_G, self);
								
								scr_SetIceSlideSpd(hspd, true);
								
								hspd = 0;
								if (dashSpd > 0)
								{
									dashSpd = 0;
									dashTime = 0;
								}
								aState = ActionState.IDLE;
								atkState = AttackState.A_STRICT_ATTACK_LV3;
								chargeCore = 0;
							}
						}
						else
						{
							if ((sprite_index != spr_ZShotC2_A) || (sprite_index == spr_ZShotC2_A && image_index > 7))
							{
								sprite_index = spr_ZShotC3_A;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZShotC3, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash3, 0, 0);
								
								scr_MeeleWeaponDestroy(obj_ZSaberImage);
								
								scr_MeeleWeaponCreate(obj_ZSaberImage, SaberState.SABER_CHARGE_COMBO_A, self);
								
								if (aState != ActionState.JUMPDASHING)
									aState = ActionState.IDLE;
								atkState = AttackState.A_STRICT_ATTACK;
								vState = VerticalState.V_MOVE_FALLING;
								chargeCore = 0;
								chargeCoreLv = 0;
							}
						}
					}	break;
					
					case -2:
					{
						if (vState == VerticalState.V_ON_GROUND)
						{
							if ((sprite_index != spr_ZShotC1_G) || (sprite_index == spr_ZShotC1_G && image_index > 7))
							{
								sprite_index = spr_ZShotC2_G;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZShotC2, 0, 0);
								
								scr_MeeleWeaponDestroy(obj_ZSaberImage);
								
								scr_SetIceSlideSpd(hspd, true);
								
								hspd = 0;
								if (dashSpd > 0)
								{
									dashSpd = 0;
									dashTime = 0;
								}
								aState = ActionState.IDLE;
								atkState = AttackState.A_STRICT_ATTACK_LV3;
								if (chargeCoreLv == 3)
									chargeCore = -3;
								else
								{
									chargeCoreLv = 0;
									chargeCore = 0;
								}
							}
						}
						else
						{
							if ((sprite_index != spr_ZShotC1_A) || (sprite_index == spr_ZShotC1_G && image_index > 7))
							{
								sprite_index = spr_ZShotC2_A;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZShotC2, 0, 0);
								
								scr_MeeleWeaponDestroy(obj_ZSaberImage);
						
								if (aState != ActionState.JUMPDASHING)
									aState = ActionState.IDLE;
								atkState = AttackState.A_STRICT_ATTACK;
								vState = VerticalState.V_MOVE_FALLING;
								if (chargeCoreLv == 3)
									chargeCore = -3;
								else
								{
									chargeCoreLv = 0;
									chargeCore = 0;
								}
							}
						}
					}	break;
				}
			}
		}
		
		if (keyboard_check(global.keyGiga) && (global.zCore[2] == ItemState.USING))
		{
			if (chargeCore == 0)
			{
				if (chargeNormal <= 0)
					chargeCore += DELTA_TIME;
				else chargeCore = 0;
			}
			
			if ((chargeCore > 0) && (chargeCore < chargeCoreLv3Limit))
			{
				chargeCore += DELTA_TIME;
				if (chargeCore >= chargeCoreLv1Limit)
				{
					if (!instance_exists(obj_ZChargeEffLv1))
					{
						var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_ZChargeEffLv1);
						objChargeEff.core = self;
						objChargeEff.chargeParameter = self.chargeNormal;
						objChargeEff.coreCharge = 1;
					}
				}
				
				if ((chargeCore >= chargeCoreLv2Limit) && (chargeCore < chargeCoreLv3Limit))
				{
					if (!instance_exists(obj_ZChargeEffLv2))
					{
						var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_ZChargeEffLv2);
						objChargeEff.core = self;
						objChargeEff.chargeParameter = self.chargeNormal;
						objChargeEff.coreCharge = 1;
						objChargeEff.chargeLevel = 2;
					}
					
					if (instance_exists(obj_ZChargeEffLv1))
						obj_ZChargeEffLv1.chargeLevel = 2;
				}

				if (chargeCore >= chargeCoreLv3Limit)
				{
					if (instance_exists(obj_ZChargeEffLv2))
					{
						if (obj_ZChargeEffLv2.chargeLevel == 2)
							obj_ZChargeEffLv2.chargeLevel = 3;
					}
				
					if (instance_exists(obj_ZChargeEffLv1))
					{
						if (obj_ZChargeEffLv1.chargeLevel == 2)
							obj_ZChargeEffLv1.chargeLevel = 3;
					}
				}
			}
		}
		
		if (keyboard_check_released(global.keyGiga))
		{
			if (global.zCore[2] == ItemState.USING)
			{
				if (chargeCore > chargeCoreLv1Limit)
				{
					if (chargeCore >= chargeCoreLv3Limit)
					{
						chargeCoreLv = 3;
					}
				
					if ((chargeCore > chargeCoreLv2Limit) && (chargeCore < chargeCoreLv3Limit))
					{
						chargeCoreLv = 2;
					}
				
					if ((chargeCore > chargeCoreLv1Limit) && (chargeCore < chargeCoreLv2Limit))
					{
						chargeCoreLv = 1;
					}
					chargeCore = -1;
					if (vState == VerticalState.V_ON_GROUND)
					{
						if (sprite_index != spr_ZShotC1_G)
						{
							sprite_index = spr_ZShotC1_G;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, snd_VZShotC1, 0, 0);
							
							scr_MeeleWeaponDestroy(obj_ZSaberImage);
							
							scr_SetIceSlideSpd(hspd, true);
							
							hspd = 0;
							if (dashSpd > 0)
							{
								dashSpd = 0;
								dashTime = 0;
							}
							aState = ActionState.IDLE;
							atkState = AttackState.A_STRICT_ATTACK_LV3;
						}
					}
					else
					{
						if (sprite_index != spr_ZShotC1_A)
						{
							sprite_index = spr_ZShotC1_A;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, snd_VZShotC1, 0, 0);
							
							scr_MeeleWeaponDestroy(obj_ZSaberImage);
						
							atkState = AttackState.A_STRICT_ATTACK;
							if (aState != ActionState.JUMPDASHING)
								aState = ActionState.IDLE;
							vState = VerticalState.V_MOVE_FALLING;
						}
					}
					if (chargeCoreLv > 1)
						chargeCore = -2;
					else
					{
						chargeCoreLv = 0;
						chargeCore = 0;
					}
				}
				else if (chargeCore > 0) 
					chargeCore = 0;
			}
		}
		
		#endregion
		
		//Double Jump
		#region
		
		if (keyboard_check_pressed(global.keyJump) && (canJump))
		{
			if ((aState == ActionState.IDLE) && atkState < (AttackState.A_STRICT_ATTACK_LV4))
			{
				if ((vState == VerticalState.V_MOVE_FALLING) && (vspd >= 0))
				{
					if (airHikeTime > 0)
					{
						sprite_index = spr_ZDoubleJump;
						image_index = 0;
						audio_play_sound_on(global.SFX_Emitter, sndJumpEff, 0, 0);
						var randVoiceJump = random(4);
						if (randVoiceJump <= 3)
						{
							if (randVoiceJump > 2) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump1, 0, 0);
							else if (randVoiceJump >1) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump2, 0, 0);
							else audio_play_sound_on(global.SFX_Emitter, sndVoiceJump3, 0, 0);
						}
				
						atkState = AttackState.A_NONE;
						canAirDash = 0;
						vspd = -jumpSpd;
						airHikeTime -- ;
					}
				}
			}
		}
		
		#endregion
	}
}