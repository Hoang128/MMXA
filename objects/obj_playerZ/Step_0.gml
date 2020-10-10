/// @description Zero's Actions
// You can write your code in this editor

//Hp
scr_playerDeath(self.object_index);

//Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	#region
	
	//Key
	#region
	
	if ((sprite_index == spr_ZEarthGaizer1)
	 || (sprite_index == spr_ZEarthGaizer2))
	{
		if (image_index < 1)
		{
			if (keyboard_check(global.keyGiga))
			{
				if (global.zp > earthGaizerCost * 2)
				{
					if (earthGaizerChargeTime < earthGaizerChargeMax)
					{
						image_index = 0;
						earthGaizerChargeTime += DELTA_TIME;
					}
					else
					{
						if (sprite_index == spr_ZEarthGaizer1)
							sprite_index = spr_ZEarthGaizer2;
					}
				}
			}
		}
		
		if ((image_index >= 1) && (image_index <= 2))
		{
			if (!audio_is_playing(snd_VZRekkoha))
			{
				audio_play_sound_on(global.SFX_Emitter, snd_VZRekkoha, 0, 0);
			}
		}
		
		if ((image_index >= 7) && (image_index <= 8))
		{
			if (earthGaizerCreateBullets == 0)
			{
				var objBullet;
				audio_play_sound_on(global.SFX_Emitter, snd_ZEarthGaizer, 0, 0);
				if (sprite_index == spr_ZEarthGaizer1)
				{
					objBullet = obj_EarthGaizerBullet1;
					global.zp -= earthGaizerCost;
				}
				else if (sprite_index == spr_ZEarthGaizer2)
				{
					objBullet = obj_EarthGaizerBullet2;
					global.zp -= earthGaizerCost * 2;
				}
				for (var i = 0; i < 8; i++)
				{
					var bullet = instance_create_depth(x, y, depth - 1, objBullet);
					bullet.direction = 11.25 + 22.5 * i;
				}
				earthGaizerCreateBullets = 1;
			}
		}
	}
	
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
		
		//Thunder dive
		if (sprite_index == spr_ZThrustDown)
		{
			sprite_index = spr_ZThrustDownEnd;
			image_index = 0;
			
			audio_play_sound_on(global.SFX_Emitter, snd_ZSkillElectEff, 0, 0);
			
			scr_MeeleWeaponDestroy(obj_ZThunderDiveImage);
			
			hspd = 0;
			activateState = ActivateState.HALF_ACTIVATE;
			atkState = AttackState.A_STRICT_ATTACK_LV2;
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
	
	if (sprite_index == spr_ZShotBarrage)
	{
		if (aState == ActionState.SP_MOVE)
		{
			if (!instance_exists(obj_ZBusterBarrageCreater))
			{
				aState = ActionState.IDLE;
				atkState = AttackState.A_NONE;
				activateState = ActivateState.ACTIVATE;
				chargeCore = 0;
				
				sprite_index = sprStand;
				image_index = 0;
			}
		}
	}
	
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
	
	//Charge shot 1
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
				global.zp -= cBusterCost;
				busterType = noone;
			}
		}
	}
	
	//Charge shot 2
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
				global.zp -= cBusterCost;
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
				hspd = (image_index - 3) * upperSlashHspd * hDir;
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
	
	if (sprite_index == spr_ZThrustDown)
	{
		if (image_index < 2)
		{
			vspd = 0;
		}
		else
			vspd = vspdThrustDown;
		chargeNormal = 0;
		image_xscale = thunderXScale;
		if (hspd > 0)
			hspd = hspd / hspd * thunderDiveMoveSpd;
	}
	
	if (sprite_index == spr_ZThrustDownEnd)
	{
		chargeNormal = 0;
		image_xscale = thunderXScale;
		if ((image_index > 0) && (image_index < 1))
		{
			if (canCreateThunderDiveWire)
			{
				var obj1 = instance_create_depth(x + 16 * image_xscale, y - 3, depth + 1, obj_ZThunderWireCreater);
				obj1.thunderNumberMax = 3;
				canCreateThunderDiveWire = false;
			}
		}
	}
	else
	{
		if (!canCreateThunderDiveWire)
			canCreateThunderDiveWire = true;
	}
	
	if (sprite_index == spr_ZDarkThrust)
	{
		hState = HorizontalState.H_MOVE_PASSIVE;
		if (image_index < startThrustFrames)
			hspd = 0;
		else if (image_index < (insSpdThrustFrames + startThrustFrames))
		{
			hspd = image_xscale * maxThrustFowardSpd / insSpdThrustFrames * (image_index - startThrustFrames);
		}
		else if (image_index < (conSpdThrustFrames + insSpdThrustFrames + startThrustFrames))
		{
			hspd = image_xscale * maxThrustFowardSpd;
		}
		else if (image_index < (desSpdThrustFrames + conSpdThrustFrames + insSpdThrustFrames + startThrustFrames))
		{
			hspd = image_xscale * maxThrustFowardSpd / desSpdThrustFrames * (desSpdThrustFrames - (image_index - insSpdThrustFrames - startThrustFrames - conSpdThrustFrames));
		}
		else
		{
			hspd = 0;
		}
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
					if ((ThrustEnable == true) && (!keyboard_check(global.keyUp) && keyboard_check(global.keyDown)))
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
					else if (aState == ActionState.SLIDING)
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
					else if (aState == ActionState.CLIMBING)
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
					else if (aState == ActionState.WIRING)
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
					else
					{
						if (sprite_index != spr_ZThrustDown)
						{
							if ((ThrustEnable == true) && (!keyboard_check(global.keyUp) && keyboard_check(global.keyDown)))
							{
								cmdUSlashFlag = false;
								cmdDSlashFlag = false;
								cmdFSlashFlag = false;
								cmdThrustFlag = true;
							}
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
		
		if (cmdThrustFlag == true)
		{
			if (vState != VerticalState.V_ON_GROUND)
			{
				if (sprite_index != spr_ZThrustDown)
				{
					sprite_index = spr_ZThrustDown;
					image_index = 0;
					
					audio_play_sound_on(global.SFX_Emitter, snd_XSkill7Shot, 0, 0);
					
					audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo3, 0, 0);
					
					scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
					scr_MeeleWeaponCreate(obj_ZThunderDiveImage, noone, self);
					
					thunderXScale = image_xscale;
					atkState = AttackState.A_STRICT_ATTACK;
					aState = ActionState.IDLE;
					vState = VerticalState.V_MOVE_DOWN;
					hState = HorizontalState.H_MOVE_NONE;
					hspd = 0;
					vspd = 0;
					cmdThrustFlag = false;
					canClimb = false;
					dashSpd = 0;
					dashTime = 0;
				}
			}
		}
		
		if (cmdFSlashFlag == true)
		{
			if (vState == VerticalState.V_ON_GROUND)
			{
				if (sprite_index != spr_ZDarkThrust)
				{
					sprite_index = spr_ZDarkThrust;
					image_index = 0;
					
					scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
					scr_MeeleWeaponCreate(obj_ZDarkThurstSaberImage, noone, self);
					
					audio_play_sound_on(global.SFX_Emitter, snd_ZSkillDarkEff, 0, 0);
					
					var voice = random(3);
					
					if (voice < 1)
						audio_play_sound_on(global.SFX_Emitter, snd_VZThrustVoice2, 0, 0);
					else if (voice < 2)
						audio_play_sound_on(global.SFX_Emitter, snd_VZThrustVoice1, 0, 0);
					
					atkState = AttackState.A_STRICT_ATTACK_LV2;
					aState = ActionState.IDLE;
					vState = VerticalState.V_MOVE_DOWN;
					hState = HorizontalState.H_MOVE_PASSIVE;
					vspd = 0;
					hspd = 0;
					cmdFSlashFlag = false;
					canClimb = false;
					dashSpd = 0;
					dashTime = 0;
				}
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
		
		//Earth Gaizer
		if (keyboard_check_pressed(global.keyGiga))
		{
			if ((!keyboard_check(global.keyUp)) && (keyboard_check(global.keyDown)))
			{
				if (global.zp > earthGaizerCost)
				{
					if (vState == VerticalState.V_ON_GROUND)
					{
						scr_MeeleWeaponDestroy(obj_ZSaberImage);
						hspd = 0;
						if (dashSpd > 0)
						{
							dashSpd = 0;
							dashTime = 0;
						}
						aState = ActionState.SP_MOVE;
						atkState = AttackState.A_FREEZE_ATTACK;
						activateState = ActivateState.HALF_ACTIVATE;
					
						sprite_index = spr_ZEarthGaizer1;
						image_index = 0;
					}
				}
			}
		}
		
		if (global.zCore[2] == ItemState.USING)
		{
			#region
			
			if (keyboard_check_pressed(global.keyGiga))
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
						
						if ((keyboard_check(global.keyUp)) && (!keyboard_check(global.keyDown)))
						{
							if (vState == VerticalState.V_ON_GROUND)
							{
								if (atkState < AttackState.A_FREEZE_ATTACK)
								{
									audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
									scr_MeeleWeaponDestroy(obj_ZSaberImage);
									sprite_index = spr_ZShotBarrage;
							
									scr_SetIceSlideSpd(hspd, true);
							
									hspd = 0;
									if (dashSpd > 0)
									{
										dashSpd = 0;
										dashTime = 0;
									}
									aState = ActionState.IDLE;
									atkState = AttackState.A_FREEZE_ATTACK;
									image_index = 0;
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
								
								global.zp -= cBusterCost;
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
								
								global.zp -= cBusterCost;
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
		
			if (keyboard_check(global.keyGiga))
			{
				if (chargeCore == 0)
				{
					if (chargeNormal <= 0)
						chargeCore += DELTA_TIME;
					else chargeCore = 0;
				}

				if (atkState != AttackState.A_FREEZE_ATTACK)
				{
					if ((chargeCore > 0) && (chargeCore < chargeCoreLv3Limit))
					{
						if (global.zp >= cBusterCost)
							chargeCore += DELTA_TIME;
						else
							chargeCore = 0;
						if (chargeCore >= chargeCoreLv1Limit)
						{
							if (global.zp < (cBusterCost * 2))
								chargeCore = chargeCoreLv1Limit;
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
							if (global.zp < (cBusterCost * 3))
								chargeCore = chargeCoreLv2Limit;
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
				
				else
				{
					if ((chargeCore > 0) && (chargeCore < chargeCoreLv2Limit))
					{
						chargeCore += DELTA_TIME;
						if (chargeCore >= chargeCoreLv1Limit)
						{
							if (global.zp < cBusterBarrage2Cost)
							{
								chargeCore = chargeCoreLv1Limit;
							}
							if (!instance_exists(obj_ZChargeEffLv1))
							{
								var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_ZChargeEffLv1);
								objChargeEff.core = self;
								objChargeEff.chargeParameter = self.chargeNormal;
								objChargeEff.coreCharge = 1;
							}
						}
					
						if (chargeCore >= chargeCoreLv2Limit)
						{
							chargeCore = chargeCoreLv2Limit;
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
					}
				}
			}
		
			if (keyboard_check_released(global.keyGiga))
			{
				if (sprite_index != spr_ZShotBarrage)
				{
					if (chargeCore >= chargeCoreLv1Limit)
					{
						if (chargeCore >= chargeCoreLv3Limit)
						{
							chargeCoreLv = 3;
						}
				
						if ((chargeCore >= chargeCoreLv2Limit) && (chargeCore < chargeCoreLv3Limit))
						{
							chargeCoreLv = 2;
						}
				
						if ((chargeCore >= chargeCoreLv1Limit) && (chargeCore < chargeCoreLv2Limit))
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
				else
				{
					if (chargeCore >= chargeCoreLv2Limit)
					{
						if (!instance_exists(obj_ZBusterBarrageCreater))
						{
							var objBusterBarrage = instance_create_depth(x + 24 * image_xscale, y - 31, depth - 1, obj_ZBusterBarrageCreater);
							objBusterBarrage.image_xscale = image_xscale;
							objBusterBarrage.lv = 2;
							
							global.zp -= cBusterBarrage2Cost;
						}
					}
					else if (chargeCore >= chargeCoreLv1Limit)
					{
						if (!instance_exists(obj_ZBusterBarrageCreater))
						{
							var objBusterBarrage = instance_create_depth(x + 24 * image_xscale, y - 31, depth - 1, obj_ZBusterBarrageCreater);
							objBusterBarrage.image_xscale = image_xscale;
							objBusterBarrage.lv = 1;
							
							global.zp -= cBusterBarrage1Cost;
						}
					}
					
					chargeCore = 0;
					
					activateState = ActivateState.HALF_ACTIVATE;
					aState = ActionState.SP_MOVE;
				}
			}
			
			#endregion
		}
		
		if (global.zCore[1] == ItemState.USING)
		{
			
		}
		
		#endregion
		
		//Double Jump
		#region
		
		if (aState == ActionState.JUMPDASHING)
		{
			if (airHikeTime != 0)
				airHikeTime = 0;
		}
		
		if (keyboard_check_pressed(global.keyJump) && (canJump))
		{
			if ((aState == ActionState.IDLE) && atkState < (AttackState.A_STRICT_ATTACK_LV4))
			{
				if ((vState != VerticalState.V_ON_GROUND) && (vspd >= 0))
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
						
						scr_MeeleWeaponDestroy(obj_PlayerWeaponMeele);
						vState = VerticalState.V_MOVE_FALLING;
						atkState = AttackState.A_NONE;
						canAirDash = 0;
						if (canClimb != true)
							canClimb = true;
						vspd = -jumpSpd;
						airHikeTime -- ;
					}
				}
			}
		}
		
		#endregion
	}
}