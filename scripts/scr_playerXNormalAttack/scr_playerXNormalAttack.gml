var armorType = argument0;

if ((sprite_index == sprDuck1) || (sprite_index == sprDuck3) || (sprite_index == sprClimb1) || (sprite_index == sprClimb3))
	return;
else
{
	switch(armorType)
	{
		case obj_playerEclipseX:
		{
			//Uncharge shot
			#region
			if (keyboard_check_pressed(global.keyAtk))
			{
				if ((aState != ActionState.SP_MOVE) && (isCrossDashing == false))
				{
					if (atkState < AttackState.A_STRICT_ATTACK)
					{
						if ((chargeNormal >= 0) && (chargeNormal < chargeLv1Limit))
						{
							if (busterOnRow < busterOnRowMax)
							{
								if (waitShot == 0)
								{
									scr_playerXChangeShotSprite(object_index, true, false);
									if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
									{
										if (partArms != 1)
										{
											var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBuster);
											obj.core = self;
											atkSpriteTime = atkSpriteTimeMax;
										}
										else
										{
											var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffSolarBuster);
											obj.core = self;
											atkSpriteTime = atkSpriteTimeMax;
										}
						
										if (sprite_index == spr_XShotClimb)
										{
											vspd = 0;
											vState = VerticalState.V_MOVE_NONE;
											isClimbing = 0;
										}
										atkState = AttackState.A_NORMAL_ATTACK;
						
										busterOnRow++;
										resetBusterOnRowMax = waitShotLong;
										if (busterOnRow == busterOnRowMax)
											waitShot = waitShotLong;
										else
											waitShot = waitShotNormal;
									}
								}
							}
						}
					}
				}
			}
			
			#endregion
		
			//Charge shot
			#region
			
			if (partArms == 0)
			{
				//X - Buster charge
				#region
				
				if (keyboard_check(global.keyAtk))
				{
					if (chargeNormal < chargeLv2Limit)
					{
						chargeNormal += DELTA_TIME;
						if (chargeNormal >= chargeLv1Limit)
						{
							if (!instance_exists(obj_XChargeEffLv1))
							{
								var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv1);
								objChargeEff.core = self;
							}
						}
					}
					else
					{
						chargeNormal = chargeLv2Limit;
						if (!instance_exists(obj_XChargeEffLv2))
						{
							var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv2);
							objChargeEff.core = self;
						}
					}
				}
				
				
				if (keyboard_check_released(global.keyAtk))
				{
					if (aState != ActionState.SP_MOVE)
					{
						if (chargeNormal >= chargeLv1Limit)
						{
							if (chargeNormal < chargeLv2Limit)
							{
								if (isCrossDashing == true)
								{
									sprite_index = sprJump3;
									image_index = 0;
									if (vDashDir == 1)
										vspd = 0;
									else
										vspd = -2;
									dashSpd = 0;
									dashTime = 0;
									aState = ActionState.IDLE;
									vState = VerticalState.V_MOVE_FALLING;
									vDashDir = 0;
								}
								scr_playerXChangeShotSprite(object_index, true, false);
								if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
								{
									var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBusterC1);
									obj.core = self;
									atkSpriteTime = atkSpriteTimeMax;
									if (sprite_index == spr_XShotClimb)
									{
										vspd = 0;
										vState = VerticalState.V_MOVE_NONE;
										isClimbing = 0;
									}
									atkState = AttackState.A_NORMAL_ATTACK;
									chargeNormal = 0;
									waitShot = waitShotLong;
									busterOnRow = 0;
								}
							}
							else
							{	
								if (isCrossDashing == true)
								{
									sprite_index = sprJump3;
									image_index = 0;
									if (vDashDir == 1)
										vspd = 0;
									else
										vspd = -2;
									dashSpd = 0;
									dashTime = 0;
									aState = ActionState.IDLE;
									vState = VerticalState.V_MOVE_FALLING;
									vDashDir = 0;
								}
								scr_playerXChangeShotSprite(object_index, true, true);
								randomize();
								var r = random(4);
								if (r >= 1)
								{
									if (r >=1 && r < 2)
										audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot1, 0, 0);
									if (r >=2 && r < 3)
										audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
									if (r >=3 && r < 4)
										audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
								}
								if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
								{
									var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBusterC2);
									obj.core = self;

									atkSpriteTime = atkSpriteTimeMax;
									if (sprite_index == spr_XShotClimb)
									{
										vspd = 0;
										vState = VerticalState.V_MOVE_NONE;
										isClimbing = 0;
									}
									atkState = AttackState.A_NORMAL_ATTACK;
									chargeNormal = 0;	
									waitShot = waitShotMax;
									busterOnRow = 0;
								}
							}
						}
						else	chargeNormal = 0;
					}	else	chargeNormal = 0;
				}
				
				#endregion
			}
			
			if (partArms == 1)
			{
				//Solar charge
				#region
				
				if (keyboard_check(global.keyAtk))
				{
					if ((chargeNormal >= 0) && (chargeNormal < chargeSolarLv3Limit))
					{
						chargeNormal += DELTA_TIME;
						if (chargeNormal >= chargeSolarLv1Limit)
						{
							if (!instance_exists(obj_XChargeEffLv1))
							{
								var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv1);
								objChargeEff.core = self;
							}
						}
						if (chargeNormal >= chargeSolarLv2Limit)
						{
							if (!instance_exists(obj_XChargeEffLv2))
							{
								var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv2);
								objChargeEff.core = self;
							}
						}
					}
					if (chargeNormal >= chargeSolarLv3Limit)
					{
						chargeNormal = chargeSolarLv3Limit;
					}
				}
				
				if (keyboard_check_pressed(global.keyAtk))
				{
					if (aState != ActionState.SP_MOVE)
					{
						if (chargeNormal == -2)
						{
							if ((sprite_index == spr_XEDoubleShot1_G) || (sprite_index == spr_XEDoubleShot1_A))
							{
								if (image_index > 4)
								{
									if (comboStack == false)
										comboStack = true;
								}
							}
							else
							{
								if (isCrossDashing == true)
								{
									sprite_index = sprJump3;
									image_index = 0;
									if (vDashDir == 1)
										vspd = 0;
									else
										vspd = -2;
									dashSpd = 0;
									dashTime = 0;
									aState = ActionState.IDLE;
									vState = VerticalState.V_MOVE_FALLING;
									vDashDir = 0;
								}
								if ((aState == ActionState.IDLE) 
								|| (aState == ActionState.DASHING) 
								|| (aState == ActionState.JUMPDASHING)
								|| (aState == ActionState.DASHKICK) 
								|| (aState == ActionState.WALLKICK))
								{
									if (vState == VerticalState.V_ON_GROUND)
									{
										sprite_index = spr_XEDoubleShot2_G;
										image_index = 0;
										
										hspd = 0;
										hState = HorizontalState.H_MOVE_NONE;
										atkState = AttackState.A_STRICT_ATTACK_LV3;
									}
									else
									{
										sprite_index = spr_XEDoubleShot2_A;
										image_index = 0;
										atkState = AttackState.A_STRICT_ATTACK;
									}
									
									if (aState == ActionState.DASHING)
									{
										if (vState == VerticalState.V_MOVE_NONE)
											vState = VerticalState.V_MOVE_FALLING;
										dashSpd = 0;
										dashTime = 0;
										aState = ActionState.IDLE;
									}
									createSolarChargeEff = false;
								}
								else
								{
									scr_playerXChangeShotSprite(object_index, true, true);
									randomize();
									var r = random(4);
									if (r >= 1)
									{
										if (r >=1 && r < 2)
											audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot1, 0, 0);
										if (r >=2 && r < 3)
											audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
										if (r >=3 && r < 4)
											audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
									}
									if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
									{
										var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffSolarBusterC3);
										obj.core = self;

										atkSpriteTime = atkSpriteTimeMax;
										if (sprite_index == spr_XShotClimb)
										{
											vspd = 0;
											vState = VerticalState.V_MOVE_NONE;
											isClimbing = 0;
										}
										atkState = AttackState.A_NORMAL_ATTACK;
									}
								}
								chargeNormal = 0;
								chargeStack = 0;
							}
						}
					}
				}
				
				if (keyboard_check_released(global.keyAtk))
				{
					if (chargeNormal > chargeSolarLv1Limit)
					{
						if (chargeNormal >= chargeSolarLv3Limit)
						{
							chargeStack = 3;
						}
				
						if ((chargeNormal >= chargeSolarLv2Limit) && (chargeNormal < chargeSolarLv3Limit))
						{
							chargeStack = 2;
						}
				
						if ((chargeNormal >= chargeSolarLv1Limit) && (chargeNormal < chargeSolarLv2Limit))
						{
							chargeStack = 1;
						}
						chargeNormal = -1;
						
						if (chargeStack == 1)
						{
							if (aState != ActionState.SP_MOVE)
							{
								if (isCrossDashing == true)
								{
									sprite_index = sprJump3;
									image_index = 0;
									if (vDashDir == 1)
										vspd = 0;
									else
										vspd = -2;
									dashSpd = 0;
									dashTime = 0;
									aState = ActionState.IDLE;
									vState = VerticalState.V_MOVE_FALLING;
									vDashDir = 0;
								}
								scr_playerXChangeShotSprite(object_index, true, true);
								randomize();
								var r = random(4);
								if (r >= 1)
								{
									if (r >=1 && r < 2)
										audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot1, 0, 0);
									if (r >=2 && r < 3)
										audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
									if (r >=3 && r < 4)
										audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
								}
								if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
								{
									var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffSolarBusterC1);
									obj.core = self;

									atkSpriteTime = atkSpriteTimeMax;
									if (sprite_index == spr_XShotClimb)
									{
										vspd = 0;
										vState = VerticalState.V_MOVE_NONE;
										isClimbing = 0;
									}
									atkState = AttackState.A_NORMAL_ATTACK;
									chargeNormal = 0;	
									waitShot = waitShotMax;
									busterOnRow = 0;
								}
								else	chargeNormal = 0;
							}	else	chargeNormal = 0;
						}
						else if (chargeStack > 1)
						{
							if (aState != ActionState.SP_MOVE)
							{
								if (isCrossDashing == true)
								{
									sprite_index = sprJump3;
									image_index = 0;
									if (vDashDir == 1)
										vspd = 0;
									else
										vspd = -2;
									dashSpd = 0;
									dashTime = 0;
									aState = ActionState.IDLE;
									vState = VerticalState.V_MOVE_FALLING;
									vDashDir = 0;
								}
								
								if ((aState == ActionState.IDLE) 
								|| (aState == ActionState.DASHING) 
								|| (aState == ActionState.JUMPDASHING)
								|| (aState == ActionState.DASHKICK) 
								|| (aState == ActionState.WALLKICK))
								{
									if (vState == VerticalState.V_ON_GROUND)
									{
										sprite_index = spr_XEDoubleShot1_G;
										image_index = 0;
										
										hspd = 0;
										hState = HorizontalState.H_MOVE_NONE;
										atkState = AttackState.A_STRICT_ATTACK_LV3;
									}
									else
									{
										sprite_index = spr_XEDoubleShot1_A;
										image_index = 0;
										
										atkState = AttackState.A_STRICT_ATTACK;
									}
									
									if (aState == ActionState.DASHING)
									{
										if (vState == VerticalState.V_MOVE_NONE)
											vState = VerticalState.V_MOVE_FALLING;
										dashSpd = 0;
										dashTime = 0;
										aState = ActionState.IDLE;
									}
									createSolarChargeEff = false;
								}
								else
								{
									scr_playerXChangeShotSprite(object_index, true, true);
									randomize();
									var r = random(4);
									if (r >= 1)
									{
										if (r >=1 && r < 2)
											audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot1, 0, 0);
										if (r >=2 && r < 3)
											audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
										if (r >=3 && r < 4)
											audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
									}
									if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
									{
										if (chargeStack == 2)
											var objBusterEff = obj_ShotEffSolarBusterC1;
										if (chargeStack == 3)
											var objBusterEff = obj_ShotEffSolarBusterC2;
										var obj = instance_create_depth(x, y, depth - 1, objBusterEff);
										obj.core = self;

										atkSpriteTime = atkSpriteTimeMax;
										if (sprite_index == spr_XShotClimb)
										{
											vspd = 0;
											vState = VerticalState.V_MOVE_NONE;
											isClimbing = 0;
										}
										atkState = AttackState.A_NORMAL_ATTACK;
									}
								}
								
								chargeNormal = -2;
							}
						}
					}
					else if (chargeNormal > 0) 
						chargeNormal = 0;
				}
				#endregion
			}
			
			#endregion
		}	break;
		case obj_playerX:
		case obj_playerXUA:
		{
			#region
			
			if (keyboard_check_pressed(global.keyAtk))
			{
				if (aState != ActionState.SP_MOVE)
				{
					if (atkState < AttackState.A_STRICT_ATTACK)
					{
						if (busterOnRow < busterOnRowMax)
						{
							if (waitShot == 0)
							{
								scr_playerXChangeShotSprite(object_index, true, false);
								if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
								{
									var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBuster);
									obj.core = self;
									atkSpriteTime = atkSpriteTimeMax;
						
									if (sprite_index == spr_XShotClimb)
									{
										vspd = 0;
										vState = VerticalState.V_MOVE_NONE;
										isClimbing = 0;
									}
									atkState = AttackState.A_NORMAL_ATTACK;
						
									busterOnRow++;
									resetBusterOnRowMax = waitShotLong;
									if (busterOnRow == busterOnRowMax)
										waitShot = waitShotLong;
									else
										waitShot = waitShotNormal;
								}
							}
						}
					}
				}
			}
		
			if (keyboard_check(global.keyAtk))
			{
				if (chargeNormal < chargeLv2Limit)
				{
					chargeNormal += DELTA_TIME;
					if (chargeNormal >= chargeLv1Limit)
					{
						if (!instance_exists(obj_XChargeEffLv1))
						{
							var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv1);
							objChargeEff.core = self;
							objChargeEff.chargeParameter = self.chargeNormal;
						}
					}
				}
				else
				{
					chargeNormal = chargeLv2Limit;
					if (!instance_exists(obj_XChargeEffLv2))
					{
						var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv2);
						objChargeEff.core = self;
						objChargeEff.chargeParameter = self.chargeNormal;
					}
				}
			}
			
			if (keyboard_check_released(global.keyAtk))
			{
				if (aState != ActionState.SP_MOVE)
				{
					if (chargeNormal >= chargeLv1Limit)
					{
						if (chargeNormal < chargeLv2Limit)
						{
							scr_playerXChangeShotSprite(object_index, true, false);
							if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
							{
								var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBusterC1);
								obj.core = self;
								atkSpriteTime = atkSpriteTimeMax;
								if (sprite_index == spr_XShotClimb)
								{
									vspd = 0;
									vState = VerticalState.V_MOVE_NONE;
									isClimbing = 0;
								}
								atkState = AttackState.A_NORMAL_ATTACK;
								chargeNormal = 0;
								waitShot = waitShotLong;
								busterOnRow = 0;
							}
						}
						else
						{	
							scr_playerXChangeShotSprite(object_index, true, true);
							randomize();
							var r = random(4);
							if (r >= 1)
							{
								if (r >=1 && r < 2)
									audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot1, 0, 0);
								if (r >=2 && r < 3)
									audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
								if (r >=3 && r < 4)
									audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
							}
							if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
							{
								if (armorType == obj_playerX)
								{
									var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBusterC2);
									obj.core = self;
								}
						
								if (armorType == obj_playerXUA)
								{
									var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffPlasmaBuster);
									obj.core = self;
								}
								atkSpriteTime = atkSpriteTimeMax;
								if (sprite_index == spr_XShotClimb)
								{
									vspd = 0;
									vState = VerticalState.V_MOVE_NONE;
									isClimbing = 0;
								}
								atkState = AttackState.A_NORMAL_ATTACK;
								chargeNormal = 0;	
								waitShot = waitShotMax;
								busterOnRow = 0;
							}
						}
					}
					else	chargeNormal = 0;
				}	else	chargeNormal = 0;
			}
		
			#endregion
		}	break;
	}
}
