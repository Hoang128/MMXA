/// @description Step

//Full passive

//Hp
if (hp <= 0)
{
	hp = 0;
	if (weight < WeighType.MASSIVE)
	{
		hspd = 0;
		vspd = 0;
		hState = HorizontalState.H_MOVE_NONE;
		vState = VerticalState.V_MOVE_NONE;
		aState = ActionState.DYING;
		activateState = ActivateState.DEACTIVATE;
		sprite_index = sprStun1;
		image_index = 0;
	}
	else	instance_destroy();
}

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive Before Action************************************************************************************
	#region
	
	//Key------------------------------------------------------------------------------------------------------
	switch (hDir)
	{
		case 1:
		{
			if (keyboard_check(global.keyRight))	keyFoward = true;
			else									keyFoward = false;
		}	break;
		case -1:
		{
			if (keyboard_check(global.keyLeft))		keyFoward = true;
			else									keyFoward = false;
		}	break;
	}
	
	//Sprite---------------------------------------------------------------------------------------------------
	#region
	
	if (image_speed < 0)
	{
		//Reserve Animation End
		if (image_index <= 1)
		{
			if (sprite_index == sprClimb3)
			{
				y += distanceToMoveAnimationLadder;
				isClimbing = 0;
				
				sprite_index = sprClimb2;
				image_index = 4;
			}
			
			if (sprite_index == sprClimb1)
			{
				isClimbing = 0;
				vState = VerticalState.V_ON_GROUND;
				aState = ActionState.IDLE;
				
				sprite_index = sprStand;
				image_index = 0;
			}
		}
	}
	
	if (weight < WeighType.MASSIVE)
	{
		scr_playerChangeStandSprite(object_index);
	}
	
	if (sprite_index == sprDash3)
	{
		if (dashTime == 0)
		{
			hspd = image_xscale * (5 - image_index) * 0.2 * dashSpdPhase2;
		}
	}
	
	#endregion
	
	//Wall kick && Dash kick-----------------------------------------------------------------------------------
	#region
	
	if (aState == ActionState.DASHKICK)
	{
		if (dashKickFlyTime <= 0)
		{
			if (atkState < AttackState.A_STRICT_ATTACK)
			{
				sprite_index = sprJump2;
				image_index = 0;
			}
			
			hState = HorizontalState.H_MOVE_NONE;
			vState = VerticalState.V_MOVE_FALLING;
			aState = ActionState.JUMPDASHING;
		}
		else
		{
			dashKickFlyTime -= DELTA_TIME;
		}
		
		if (hState == HorizontalState.H_MOVE_PASSIVE)
		{
			if (collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top,obj_block, false, true))
			{
				sprite_index = sprJump2;
				image_index = 0;
				
				hState = HorizontalState.H_MOVE_NONE;
				vState = VerticalState.V_MOVE_FALLING;
				aState = ActionState.JUMPDASHING;
			}
			if (dashKickTime <= 0)
			{
				var hMoveL = keyboard_check(global.keyLeft);
				var hMoveR = keyboard_check(global.keyRight);
		
				var hMove = hMoveR - hMoveL;
				
				if (hMove * hDir <= 0)
				{
					if (sprite_index != sprJump2)
					{
						sprite_index = sprJump2;
						image_index = 0;
					}
				}
				
				hspd = 0;
				canSlide = 1;
				hState = HorizontalState.H_MOVE_NONE;
			}
			else 
			{
				hDir = sign(hspd);
				dashKickTime -= DELTA_TIME;
			}
		}
	}
	
	if (aState == ActionState.WALLKICK)
	{
		if (hState == HorizontalState.H_MOVE_PASSIVE)
		{
			if ((wallKickTime <= 0) ||(collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top,obj_block, false, true)))
			{
				if (atkState < AttackState.A_STRICT_ATTACK)
				{
					sprite_index = sprJump2;
					image_index = 0;
				}
				if (wallKickTime2 == 0) wallKickTime2 = wallKickTimeMax2;
				hspd = 0;
				canSlide = 1;
				hState = HorizontalState.H_MOVE_NONE;
				vState = VerticalState.V_MOVE_FALLING;
			}
			else if (wallKickTime > 0) wallKickTime -= DELTA_TIME;
		}
		else
		{
			if (wallKickTime2 > 0) 
			{
				if ((hspd != 0) && (lastWallKickSide != 0))
				{
					if (hDir == lastWallKickSide)
						hspd = 0;
					else
					{
						if (lastWallKickSide != 0)
							lastWallKickSide = 0;
					}
				}
				wallKickTime2 -= DELTA_TIME;
			}
		}
	}
	
	#endregion
	
	//Passive Counters-----------------------------------------------------------------------------------------
	#region
	
	if (canJump == 0)
	{
		if (canJumpWait < 0)
		{
			canJump = 1;
			canJumpWait = canJumpWaitMax;
		}
		else
		{
			canJumpWait -= DELTA_TIME;
		}
	}
	
	if (stunTime > 0)
	{
		if (blink > 0) blink -= DELTA_TIME;
		else blink = blinkMax;
		stunTime -= DELTA_TIME;
	}
	else
	{
		blink = 0;
		stunTime = 0;
	}
	
	if (wireTime > 0)
	{
		wireTime -= DELTA_TIME;
	}
	else
		wireTime = 0;
		
	#endregion
	
	//Passive with enviroment----------------------------------------------------------------------------------
	#region
	
	switch(inWater)
	{
		case InLiquid.FULL:
		{
			grav = GRAVITY_WATER;
			maxGrav = MAX_FALL_WATER;
		}	break;
		default:
		{
			grav = GRAVITY_AIR;
			maxGrav = MAX_FALL_AIR;
		}
	}
	
	#endregion
	
	//Collision------------------------------------------------------------------------------------------------
	#region
	
	//Horizontal
	#region
	
	if (place_meeting(x + hspd, y, obj_block))
	{
		while(!place_meeting(x + sign(hspd), y, obj_block))
		{
			x += sign(hspd);
		}
		if (!place_meeting(x + hspd, y - maxDisDetectSlopeAbove, obj_block))
		{
			while (place_meeting(x + hspd, y, obj_block)) y--;
		}
		else
			hspd = 0;
	}
	
	x += hspd * DELTA_TIME;
	
	#endregion
	
	//Vertical
	#region
	
	//Avoid top floor collision
	if ((vState != VerticalState.V_ON_GROUND))
	{
		while (place_meeting(x, y-1, obj_block))
		{
			y++;
		}
	}
	
	//Vertical collision with block
	if (place_meeting(x, y + vspd, obj_block))
	{
		while(!place_meeting(x, y + sign(vspd), obj_block))
		{
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	//Vertical collision with dynamic block (ladder, etc...)
	if ((weight != WeighType.MASSIVE) && (instance_exists(obj_dynamicBlock)))
	{
		if ((dynamicBlock != noone) && (dynamicBlock.solid))
		{
			if (place_meeting(x, y + vspd, dynamicBlock))
			{
				while(!place_meeting(x, y + sign(vspd), dynamicBlock))
				{
					y += sign(vspd);
				}
				vspd = 0;
			}
		}
	}
	
	y += vspd * DELTA_TIME;
	
	#endregion
	
	#endregion
	
	//Gravity--------------------------------------------------------------------------------------------------
	#region
	if (place_meeting(x, y + 1, obj_block) || (place_meeting(x, y + 1, dynamicBlock) && dynamicBlock.solid == 1))
	{
		vspd = 0;
		if ((vState != VerticalState.V_ON_GROUND) && (aState != ActionState.CLIMBING) && (aState != ActionState.STUNNING))
		{
			if (aState != ActionState.BEAMDOWN)
			{
				if (atkState <= AttackState.A_NORMAL_ATTACK)
				{
					sprite_index = sprLand;
					image_index = 0;
				}
				audio_play_sound_on(global.SFX_Emitter, sndLandEff, 0, 0);
			
				canSlide = 0;
				if (aState == ActionState.JUMPDASHING)
				{
					if (dashPhase > 0)
					{
						dashSpd = 0;
						dashPhase = 0;
					}
				}
				if (!canAirDash)
					canAirDash = 1;
			}
			else
			{
				if (sprite_index = sprFlash)
					sprite_index = sprBeamDown;
			}
			vState = VerticalState.V_ON_GROUND;
			aState = ActionState.IDLE;
		}
	}
	else
	{
		if (vState == VerticalState.V_MOVE_FALLING)
		{
			
			if (place_meeting(x, y + minSlideHeigh, obj_block)) canSlide = 0;
			else
			{
				if ((!canSlide) && (vspd >= 0)) canSlide = 1;
			}
			if (vspd < maxGrav)
				vspd += grav * DELTA_TIME;
		}
		if (vState == VerticalState.V_MOVE_NONE)
		{
			if (aState == ActionState.DASHING)
			{
				if (place_meeting(x, y + maxDisDetectSlopeAbove, obj_block))
				{
					while (!place_meeting(x, y + 1, obj_block))
					{
						y++;
					}
					canAirDash = 1;
					vState = VerticalState.V_ON_GROUND;
				}
			}
		}
		if (vState == VerticalState.V_ON_GROUND)
		{
			if (aState != ActionState.STARTDOWN)
			{
				if (!place_meeting(x, y + maxDisDetectSlopeAbove, obj_block))
				{
					if (sprite_index == sprDash3)
					{
						if (dashTime == 0)
						{
							hspd = 0;
						}
					}
					
					sprite_index = sprJump3;
					image_index = 0;
				
					if (atkState > AttackState.A_NORMAL_ATTACK)
					{
						if (instance_exists(obj_PlayerWeaponMeele))
						{
							scr_MeeleWeaponDestroy(obj_PlayerWeaponMeeleImage);
						
						}
						atkState = AttackState.A_NONE;
					}
					
					aState = ActionState.IDLE;
					vState = VerticalState.V_MOVE_FALLING;
				}
				else
				{
					while (!place_meeting(x, y + 1, obj_block))
					{
						y++;
					}
				}
			}
		}
		if (vState == VerticalState.V_MOVE_DOWN || vState == VerticalState.V_MOVE_UP)
		{
			if (aState == ActionState.SLIDING)
			{
				if (sprite_index == sprSlide1)
					vspd = 0;
				if (sprite_index == sprSlide2)
					vspd = slideSpd;
				
				if ((place_meeting(x, y + minSlideHeigh, obj_block)) || (!place_meeting(x + hDir * minWallKickRange, y, obj_block)))
				{
					sprite_index = sprJump3;
					image_index = 0;
					
					canSlide = 0;
					vspd = slideSpd / 2;
					aState = ActionState.IDLE;
					if (atkState < AttackState.A_STRICT_ATTACK_LV2) atkState = AttackState.A_NONE;
					vState = VerticalState.V_MOVE_FALLING;
				}
			}
			if (aState == ActionState.BEAMDOWN)
			{
				vspd = beamSpd;
			}
		}
	}
	#endregion
	
	#endregion
	//*********************************************************************************************************
	
	//Active***************************************************************************************************
	#region
	if (activateState == ActivateState.ACTIVATE)
	{
		//Key Left Right---------------------------------------------------------------------------------------
		#region
		
		var hMoveL = keyboard_check(global.keyLeft);
		var hMoveR = keyboard_check(global.keyRight);
		
		var hMove = hMoveR - hMoveL;
		if (hMove != 0)
		{
			//Normal run
			if((aState != ActionState.DASHING) && (aState != ActionState.CLIMBING) && (aState != ActionState.WIRING))
			{
				if (atkState < AttackState.A_STRICT_ATTACK_LV2)
					hDir = hMove;
				if (aState != ActionState.DUCKING)
				{
					var wallIsAHead = (place_meeting(x + hDir, y, obj_block) && (!place_meeting(x + hDir, y, obj_slope) && !place_meeting(x + hDir, y, obj_blockIceSlope)));
					if (!wallIsAHead)
					{
						//Jump dash
						if (aState == ActionState.JUMPDASHING)
						{
							if (atkState < AttackState.A_STRICT_ATTACK_LV2)
							{
								hspd = hDir * jumpDashSpd;
								hState = HorizontalState.H_MOVE_FORWARD;
							}
						}
						
						//Wall kick
						else if (aState == ActionState.WALLKICK)
						{
							if (hState != HorizontalState.H_MOVE_PASSIVE)
							{
								hspd = hDir * runSpd;
								hState = HorizontalState.H_MOVE_FORWARD;
							}
							//else hDir = sign(hspd);
						}
						
						//Dash kick
						else if (aState == ActionState.DASHKICK)
						{
							if (hState != HorizontalState.H_MOVE_PASSIVE)
							{	
								hspd = hDir * dashSpdPhase2;
								hState = HorizontalState.H_MOVE_FORWARD;
							}
							else hDir = sign(hspd);
						}
						
						//Run
						else
						{
							if (atkState < AttackState.A_STRICT_ATTACK_LV2)
							{
								if ((aState == ActionState.IDLE) && (vState == VerticalState.V_ON_GROUND)) 
								{
									if (atkState < AttackState.A_STRICT_ATTACK)
									{
										if ((sprite_index != sprRunStart) && (sprite_index != sprRun))
										{
											sprite_index = sprRunStart;
											image_index = 0;
										}
									}
								}
								hspd = hDir * runSpd;
								scr_SetIceSlideSpd(hspd, false);
								hState = HorizontalState.H_MOVE_FORWARD;
							}
						}
					}
					else
					{
						hDir = hMove;
						hspd = 0;
						hState = HorizontalState.H_MOVE_NONE;
							
						//Stop run if see wall
						if (vState == VerticalState.V_ON_GROUND)
						{
							if (sprite_index == sprRun || sprite_index == sprRunStart)
							{
								sprite_index = sprRunEnd;
								image_index = 0;
							}
						}
						else
						{			
							//Slide
							if(weight != WeighType.MASSIVE)
							{
								if (atkState < AttackState.A_STRICT_ATTACK)
								{
									if ((aState != ActionState.SLIDING) && (aState != ActionState.WIRING) && (canSlide))
									{
										if (!place_meeting(x + hDir, y, obj_blockNoSlide) && !place_meeting(x + hDir, y, obj_blockIceNoSlide))
										{
											sprite_index = sprSlide1;
											image_index = 0;
											audio_play_sound_on(global.SFX_Emitter, sndSlideEff, 0, 0);
										
											if (!canAirDash) canAirDash = 1;
											vState = VerticalState.V_MOVE_DOWN;
											aState = ActionState.SLIDING;
											atkState = AttackState.A_NONE;
										}
									}
								}
							}
						}
					}
				}
			}
			else
			//Cancel Dash by run
			{
				if ((aState != ActionState.CLIMBING) && (aState != ActionState.WIRING))
				{
					if (hMove * hDir < 0)
					{
						hDir = hMove;
						if (vState == VerticalState.V_MOVE_NONE)
						{
							sprite_index = sprJump3;
							image_index = 0;
							hspd = 0;
							vState = VerticalState.V_MOVE_FALLING;
						}
						else
						{
							sprite_index = sprDash3;
							image_index = 0;
							
							scr_SetIceSlideSpd(hspd, true);
							hspd = 0;
						}
						aState = ActionState.IDLE;
					}
				}
				else hDir = hMove;
			}
		}
		else
		{
			//Stop run
			if (hState == HorizontalState.H_MOVE_FORWARD)
			{
				if (aState != ActionState.DASHING)
				{
					if (sprite_index == sprRun || sprite_index == sprRunStart)
					{
						sprite_index = sprRunEnd;
						image_index = 0;
					}
					
					scr_SetIceSlideSpd(hspd, true);
					
					hspd = 0;
					hState = HorizontalState.H_MOVE_NONE;
				}
			}
			
			//Stop slide
			else
			{
				if (aState == ActionState.SLIDING)
				{
					sprite_index = sprJump3;
					image_index = 0;

					vspd = slideSpd / 2;
					vState = VerticalState.V_MOVE_FALLING;
					aState = ActionState.IDLE;
					if (atkState < AttackState.A_STRICT_ATTACK_LV2) 
						atkState = AttackState.A_NONE;
				}
			}
		}
		
		#endregion
		
		//Key Up Down------------------------------------------------------------------------------------------
		#region
		
		if (keyboard_check(global.keyDown) && !keyboard_check(global.keyUp))
		{
			if (vState == VerticalState.V_ON_GROUND)
			{
				if (aState == ActionState.IDLE)
				{
					if (atkState < AttackState.A_STRICT_ATTACK_LV2)
					{
						if (dynamicBlock != noone)
						{
							var dynamicBlockIsTopLadder = (dynamicBlock.object_index == obj_ladder && (dynamicBlock.topLadder));
							var canClimbDown = (dynamicBlock.solid) && (!place_meeting(x, y + 1, obj_block));
							var xPosCorrect = (abs(self.x - (dynamicBlock.bbox_right + dynamicBlock.bbox_left) / 2) <= minDistanceToLadder);
						
							//Climb down from top ladder
							if (dynamicBlockIsTopLadder && canClimbDown && xPosCorrect)
							{
								sprite_index = sprClimb3;
								image_index = 3;
						
								with(dynamicBlock)
								{
									solid = 0;
									canSolid = 0;
									dynamicBlock = noone;
								}
							
								self.x = (dynamicBlock.bbox_right + dynamicBlock.bbox_left) / 2;
								isClimbing = -1;
								hspd = 0;
								hState = HorizontalState.H_MOVE_NONE;
								vState = VerticalState.V_MOVE_NONE;
								aState = ActionState.CLIMBING;
								atkState = AttackState.A_NONE;
							}
						
							//Duck
							else
							{
								sprite_index = sprDuck1;
								image_index = 0;
				
								hspd = 0;
								hState = HorizontalState.H_MOVE_NONE;
								aState = ActionState.DUCKING;
							}
						}
						//Duck
						else
						{
							sprite_index = sprDuck1;
							image_index = 0;
				
							hspd = 0;
							hState = HorizontalState.H_MOVE_NONE;
							aState = ActionState.DUCKING;
						}
					}
				}
				
				//Jump down
				if (keyboard_check_pressed(global.keyJump) && (canJump))
				{
					if (atkState < AttackState.A_STRICT_ATTACK)
					{
						if (dynamicBlock != noone)
						{
							var dynamicBlockIsThinPlatform = (dynamicBlock != noone) && (dynamicBlock.object_index == obj_thinPlatform);
							var canJumpDown = (dynamicBlock.solid) && (!place_meeting(x, y + 1, obj_block));
							if (dynamicBlockIsThinPlatform && canJumpDown)
							{
								sprite_index = sprJump3;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, sndJumpEff, 0, 0);
						
								with(dynamicBlock)
								{
									solid = 0;
									canSolid = 0;
									dynamicBlock = noone;
								}
								canJump = 0;
								vState = VerticalState.V_MOVE_FALLING;
								aState = ActionState.IDLE;
								atkState = AttackState.A_NONE;
							}
						}
					}
				}
			}
		}
		
		if (!keyboard_check(global.keyDown))
		{
			//Unduck
			if (vState == VerticalState.V_ON_GROUND)
			{
				if (aState == ActionState.DUCKING)
				{
					if (atkState == AttackState.A_NONE)
					{
						sprite_index = sprDuck3;
						if (sprite_index == sprDuck2)
						{
							image_index = 0;
						}
						if (sprite_index == sprDuck1)
						{
							image_index = 1;
						}
						aState = ActionState.IDLE;
					}
				}
			}
		}
		
		//Climbing
		if (aState == ActionState.CLIMBING)
		{
			if (place_meeting(x, y + 1, obj_block))
			{
				if (sprite_index == sprClimb2)
				{
					sprite_index = sprClimb1;
					image_index = 3;
				
					isClimbing = -1;
				}
			}
			
			if (!place_meeting(x, y - 1, obj_block) && !place_meeting(x, y + 1, obj_block))
			{
				if ((atkState == AttackState.A_NONE) && (sprite_index == sprClimb2))
				{
					if (!place_meeting(x, bbox_top - 1, obj_ladder))
					{
						sprite_index = sprClimb3;
						image_index = 0;
						
						y -= distanceToMoveAnimationLadder;
						while (!place_meeting(x, y + 1, obj_ladder)) y++;
						isClimbing = 1;
						vspd = 0;
						vState = VerticalState.V_ON_GROUND;
						aState = ActionState.IDLE;
					}
					else
					{
						var moveUp = keyboard_check(global.keyUp); 
						var moveDown = keyboard_check(global.keyDown);
						var vMove = moveDown - moveUp;
					
						if (vMove != 0)
						{
							if (vState == VerticalState.V_MOVE_NONE)
							{
								vspd = vMove * climbSpd;
								if (moveDown) 
								{
									isClimbing = -1;
									vState = VerticalState.V_MOVE_DOWN;
								}
								else
								{
									isClimbing = 1;
									vState = VerticalState.V_MOVE_UP;
								}
							}
						}
						else
						{
							if (vState != VerticalState.V_MOVE_NONE)
							{
								vspd = 0;
								isClimbing = 0;
								vState = VerticalState.V_MOVE_NONE;
							}
						}
					}
				}
			}
		}
		
		#endregion
		
		//Wiring-----------------------------------------------------------------------------------------------
		#region
		
		if (aState == ActionState.WIRING)
		{
			var moveUp = keyboard_check(global.keyUp); 
			var moveDown = keyboard_check(global.keyDown);
			var vMove = moveDown - moveUp;
			
			with (wirer)
			{
				x = core.x;
				y = core.y - core.yDistanceToWirer;
			}
			
			if ((sprite_index != sprWiredStartH) && (sprite_index != sprWiredStartV) && (atkState <= AttackState.A_NORMAL_ATTACK))
			{
				switch(wireType)
				{
					case WireType.HORIZONTAL:
					{
						if (dashPhase == 0)
						{
							if (!place_meeting(x + hDir * runSpd, y, obj_block) && collision_rectangle(wirer.x + hDir * 4, wirer.y + 1, wirer.x + hDir * (4 + runSpd), wirer.y - 1, obj_wire, false, false))
							{
								if (hMove != 0)
								{
									if (sprite_index == sprWired)
									{
										sprite_index = sprWiredForward;
										image_index = 0;
									}
									hState = HorizontalState.H_MOVE_FORWARD;
								}
								else
								{
									if (sprite_index != sprWired)
									{
										sprite_index = sprWired;
										image_index = 0;
									}
									hState = HorizontalState.H_MOVE_NONE;
								}
								
								hspd = hMove * runSpd;
							}
							else
							{
								if (sprite_index != sprWired)
								{
									sprite_index = sprWired;
									image_index = 0;
								}
								
								hspd = 0;
								hState = HorizontalState.H_MOVE_NONE;
							}
						vspd = 0;
						}
					}	
					break;
				
					case WireType.VERTICAL:
					{
						hspd = 0;
						if (dashPhase == 0)
						{
							if (!place_meeting(x, y + vMove * runSpd, obj_block) && collision_rectangle(wirer.x - 1, wirer.y + vMove * 4, wirer.x + 1, wirer.y + vMove * (4 + runSpd), obj_wire, false, false))
							{
								if (vMove > 0)
									vState = VerticalState.V_MOVE_DOWN;
								else if (vMove < 0)
									vState = VerticalState.V_MOVE_UP;
								else
									vState = VerticalState.V_MOVE_NONE;
								vspd = vMove * runSpd;
								if (vspd < 0)
								{
									if (sprite_index != sprWiredUp)
									{
										sprite_index = sprWiredUp;
										image_index = 0;
									}
								}
								if (vspd > 0)
								{
									if (sprite_index != sprWiredDown)
									{
										sprite_index = sprWiredDown;
										image_index = 0;
									}
								}
								if (vspd == 0)
								{
									if (sprite_index != sprWired)
									{
										sprite_index = sprWired;
										image_index = 0;
									}
								}
							}
							else
							{
								if (sprite_index != sprWired)
								{
									sprite_index = sprWired;
									image_index = 0;
								}
								
								vspd = 0;
								vState = VerticalState.V_MOVE_NONE;
							}
						}
					}	
					break;
				}
			}
			
		}
		
		if (aState != ActionState.WIRING)
		{
			if (keyboard_check(global.keyUp))
			{
				if (collision_rectangle(x - 1, bbox_top, x + 1, bbox_top + 8, obj_wire, false, true))
				{
					if (wireTime == 0)
					{
						var wire = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top + 8, obj_wire, false, true);
						if (place_meeting(x, y + 1, obj_block))
							y--;
						
					
						hspd = 0;
						vspd = 0;
						switch (wire.object_index)
						{
							case obj_wireHorizontal:	
							{
								wireType = WireType.HORIZONTAL;
								sprite_index = sprWiredStartH;
								image_index = 0;
								x = clamp(x, wire.bbox_left, wire.bbox_right);
								y = wire.y + yDistanceToWirer;
								
								while(collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_block, false, true))
								{
									x ++;
								}
						
								while(collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_block, false, true))
								{
									x --;
								}
								
							}	break;
							case obj_wireVertical:
							{
								wireType = WireType.VERTICAL;
								sprite_index = sprWiredStartV;
								image_index = 0;
								x = wire.x;
								y = clamp(y, wire.bbox_bottom + yDistanceToWirer, wire.bbox_top + yDistanceToWirer);
								
								while(place_meeting(x, y + 1, obj_block))
								{
									y--;
								}
								
							}	break;
							case noone:					
							{
								wireType = WireType.NONE;		
							}	break;
						}
						
						wirer = instance_create_depth(x, y - yDistanceToWirer, depth - 1, objWire);
						wirer.core = self;
						canAirDash = 1;
						dashPhase = 0;
						dashTime = 0;
						vState = VerticalState.V_MOVE_NONE;
						hState = HorizontalState.H_MOVE_NONE;
						aState = ActionState.WIRING;
					}
				}
			}
		}
		
		#endregion
		
		//Dashing----------------------------------------------------------------------------------------------
		#region
		
		//Start dash
		var wallIsAHead = (place_meeting(x + hDir, y, obj_block) && (!place_meeting(x + hDir, y, obj_slope) && !place_meeting(x + hDir, y, obj_blockIceSlope)));
		var downWallIsAhead = (place_meeting(x, y + 1, obj_block));
		var upWallIsAhead = (place_meeting(x, y - 1, obj_block));
		if ((aState != ActionState.CLIMBING) && (aState != ActionState.WIRING) && (atkState < AttackState.A_STRICT_ATTACK_LV3))
		{
			if (keyboard_check_pressed(global.keyDash))
			{
				if ((UN_DashKeyEnable == true) && (keyboard_check(global.keyUp) && !keyboard_check(global.keyDown)))
				{
					UN_DashFlag = true;
				}
				if ((UF_DashKeyEnable == true) && (keyboard_check(global.keyUp) && !keyboard_check(global.keyDown) && (keyFoward)))
				{
					UF_DashFlag = true;
					UN_DashFlag = false;
				}
				if ((DN_DashKeyEnable == true) && (keyboard_check(global.keyDown) && !keyboard_check(global.keyUp)))
				{
					DN_DashFlag = true;
				}
				if ((DF_DashKeyEnable == true) && (keyboard_check(global.keyDown) && !keyboard_check(global.keyUp) && (keyFoward)))
				{
					DF_DashFlag = true;
					DN_DashFlag = false;
				}
				if ((DF_DashFlag == false) && (DN_DashFlag == false) && (UF_DashFlag == false) && (UN_DashFlag == false))
				{
					if (!wallIsAHead)
					{
						if (aState != ActionState.JUMPDASHING)
						{
							if (vState != VerticalState.V_ON_GROUND)
							{
								if (canAirDash)
								{
									sprite_index = sprDash1;
									image_index = 2;
							
									dashPhase = 1;
									dashTime = maxAirDashTime;
									vspd = 0;
									if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
									vState = VerticalState.V_MOVE_NONE;
									hState = HorizontalState.H_MOVE_FORWARD;
									aState = ActionState.DASHING;
									canAirDash = 0;
								}
							}
							else
							{
								sprite_index = sprDash1;
								image_index = 0;
						
								dashPhase = 1;
								dashTime = maxDashTime;
								if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
								hState = HorizontalState.H_MOVE_FORWARD;
								aState = ActionState.DASHING;
							}
						}
					}
				}
			}
		}
		else if ((aState == ActionState.WIRING) && (atkState < AttackState.A_STRICT_ATTACK_LV3))
		{
			if (keyboard_check_pressed(global.keyDash))
			{
				if (wireType == WireType.HORIZONTAL)
				{
					if (!wallIsAHead)
					{
						if (collision_rectangle(wirer.x + hDir * (4 + dashSpdPhase2 - 1), wirer.y + 1, wirer.x + hDir * (4 + dashSpdPhase2), wirer.y - 1, obj_wire, false, false))
						{
							dashPhase = 2;
							dashTime = maxDashTime / 2;
							if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
							hState = HorizontalState.H_MOVE_FORWARD;
						}
					}
				}
				if (wireType == WireType.VERTICAL)
				{
					if (keyboard_check(global.keyUp))
					{
						if (!upWallIsAhead)
						{
							if (collision_rectangle(wirer.x - 1, wirer.y - (4 + dashSpdPhase2 - 1), wirer.x + 1, wirer.y - (4 + dashSpdPhase2), obj_wire, false, false))
							{
								if (sprite_index != sprWiredUp)
								{
									sprite_index = sprWiredUp;
									image_index = 0;
								}
								dashPhase = 2;
								dashTime = maxDashTime / 2;
								vDir = -1;
								vState = VerticalState.V_MOVE_UP;
							}
						}
					}
					if (keyboard_check(global.keyDown))
					{
						if (!downWallIsAhead)
						{
							if (collision_rectangle(wirer.x - 1, wirer.y + (4 + dashSpdPhase2 - 1), wirer.x + 1, wirer.y + (4 + dashSpdPhase2), obj_wire, false, false))
							{
								if (sprite_index != sprWiredDown)
								{
									sprite_index = sprWiredDown;
									image_index = 0;
								}
								dashPhase = 2;
								dashTime = maxDashTime / 2;
								vDir = 1;
								vState = VerticalState.V_MOVE_DOWN;
							}
						}
					}
				}
			}
		}
		
		//Dash phase speed
		switch dashPhase
		{
			case 1: dashSpd = dashSpdPhase1; break;
			case 2: dashSpd = dashSpdPhase2; break;
			default: dashSpd = 0; break;
		}
		
		//Dash time decrease
		if ((aState == ActionState.DASHING) || (aState == ActionState.WIRING))
		{
			if (dashTime > 0) 
			{
				if (aState == ActionState.WIRING)
				{
					if (wireType == WireType.VERTICAL)
					{
						hspd = 0;
						vspd = dashSpd * vDir;
					}
					if (wireType == WireType.HORIZONTAL)
					{
						hspd = dashSpd * hDir;
						vspd = 0;
					}
				}
				else	hspd = dashSpd * hDir;
				dashTime -= DELTA_TIME;
			}
		}
		else	
		{
			if (aState != ActionState.JUMPDASHING)
				dashPhase = 0;
		}
		
		//End dash
		var wallIsAHead = ((place_meeting(x + hDir, y, obj_block)) && (!place_meeting(x + hDir, y, obj_slope) && !place_meeting(x + hDir, y, obj_blockIceSlope)));
		var downWallIsAhead = (place_meeting(x, y + 1, obj_block));
		var upWallIsAhead = (place_meeting(x, y - 1, obj_block));
		if (aState == ActionState.DASHING)
		{
			if (keyboard_check_released(global.keyDash) || (wallIsAHead) || (dashTime <= 0))
			{
				if (vState != VerticalState.V_ON_GROUND)
				{
					sprite_index = sprJump3;
					image_index = 0;
					
					hspd = 0;
					dashTime = 0;
					vState = VerticalState.V_MOVE_FALLING;
				}
				else
				{
					sprite_index = sprDash3;
					image_index = 0;
					
					if (dashTime > 0)
						hspd = 0;
					else
						dashTime = 0;
					
					scr_SetIceSlideSpd(hspd, true);
				}
				dashPhase = 0;
				aState = ActionState.IDLE;
				hState = HorizontalState.H_MOVE_NONE;
			}
		}
		if (aState == ActionState.WIRING)
		{
			switch (wireType)
			{
				case WireType.HORIZONTAL:
				{
					if (dashSpd > 0)
					{
						var hOnWire = collision_rectangle(wirer.x + hDir * (4 + dashSpdPhase2 - 1), wirer.y + 1, wirer.x + hDir * (4 + dashSpdPhase2), wirer.y - 1, obj_wire, false, false);
						if (keyboard_check_released(global.keyDash) || (wallIsAHead) || (!hOnWire) || (dashTime <= 0))
						{
							sprite_index = sprWired;
							image_index = 0;
							hspd = 0;
							hState = HorizontalState.H_MOVE_NONE;
							dashPhase = 0;
						}
					}
				}	break;
				
				case WireType.VERTICAL:
				{
					if (dashSpd > 0)
					{
						var vOnWire = collision_rectangle(wirer.x - 1, wirer.y + vDir * (4 + dashSpdPhase2 - 1), wirer.x + 1, wirer.y + vDir * (4 + dashSpdPhase2), obj_wire, false, false)
						if (keyboard_check_released(global.keyDash) || (upWallIsAhead) || (downWallIsAhead) || (!vOnWire) || (dashTime <= 0))
						{
							sprite_index = sprWired;
							image_index = 0;
							vspd = 0;
							vState = VerticalState.V_MOVE_NONE;
							dashPhase = 0;
						}
					}
				}	break;
			}
		}
		
		#endregion
		
		//Default jumping---------------------------------------------------------------------------------------
		#region
		
		//Start jump
		if (keyboard_check_pressed(global.keyJump) && (canJump) && (atkState < AttackState.A_STRICT_ATTACK_LV4))
		{
			//Normal jump
			#region
			
			if (vState == VerticalState.V_ON_GROUND)
			{
				if ((UN_JumpKeyEnable == true) && (keyboard_check(global.keyUp) && !keyboard_check(global.keyDown)))
				{
					UN_JumpFlag = true;
				}
				if ((UF_JumpKeyEnable == true) && (keyboard_check(global.keyUp) && !keyboard_check(global.keyDown) && (keyFoward)))
				{
					UF_JumpFlag = true;
					UN_JumpFlag = false;
				}
				if ((DN_JumpKeyEnable == true) && (keyboard_check(global.keyDown) && !keyboard_check(global.keyUp)))
				{
					DN_JumpFlag = true;
				}
				if ((DF_JumpKeyEnable == true) && (keyboard_check(global.keyDown) && !keyboard_check(global.keyUp) && (keyFoward)))
				{
					DF_JumpFlag = true;
					DN_JumpFlag = false;
				}
				if ((UN_JumpFlag == false) && (UF_JumpFlag == false) && (DN_JumpFlag == false) && (DF_JumpFlag == false))
				{
					sprite_index = sprJump1;
					image_index = 0;
					audio_play_sound_on(global.SFX_Emitter, sndJumpEff, 0, 0);
					var randVoiceJump = random(4);
					if (randVoiceJump <= 3)
					{
						if (randVoiceJump > 2) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump1, 0, 0);
						else if (randVoiceJump >1) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump2, 0, 0);
						else audio_play_sound_on(global.SFX_Emitter, sndVoiceJump3, 0, 0);
					}
				
					canJump = 0;
					vspd = -jumpSpd;
					if (keyboard_check(global.keyDash))
					{
						aState = ActionState.JUMPDASHING;
					}
					else
						aState = ActionState.IDLE;
					if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
					vState = VerticalState.V_MOVE_FALLING;
				}
			}
			
			#endregion
			
			//Jump down form ladder & Wall kick
			#region

			else
			{
				//Jump down from ladder
				if (aState == ActionState.CLIMBING)
				{
					if (sprite_index == sprClimb2)
					{
						sprite_index = sprJump3;
						image_index = 0;
						
						canJump = 0;
						vState = VerticalState.V_MOVE_FALLING;
						aState = ActionState.IDLE;
						if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
					}
				}
				
				//Jump down from a wire
				if (aState == ActionState.WIRING)
				{
					if (sprite_index != sprWiredStart)
					{
						sprite_index = sprJump1;
						image_index = 0;
						audio_play_sound_on(global.SFX_Emitter, sndJumpEff, 0, 0);
						var randVoiceJump = random(4);
						if (randVoiceJump <= 3)
						{
							if (randVoiceJump > 2) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump1, 0, 0);
							else if (randVoiceJump >1) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump2, 0, 0);
							else audio_play_sound_on(global.SFX_Emitter, sndVoiceJump3, 0, 0);
						}
				
						canJump = 0;
						if (keyboard_check(global.keyDown))
							vspd = 0;
						else
							vspd = -jumpSpd;
						if (keyboard_check(global.keyDash))
						{
							aState = ActionState.JUMPDASHING;
						}
						else
							aState = ActionState.IDLE;
						if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						wireType = WireType.NONE;
						wirer = noone;
						wireTime = wireTimeMax;
						vState = VerticalState.V_MOVE_FALLING;
					}
				}
				
				//Wall kick
				if ((aState == ActionState.SLIDING) || (place_meeting(x + hDir, y, obj_block) && !place_meeting(x + hDir, y, obj_blockNoSlide) && !place_meeting(x + hDir, y, obj_blockIceNoSlide) && canSlide))
				{
					if (weight < WeighType.MASSIVE)
					{
						//Dash kick
						if ((aState != ActionState.DASHKICK) && keyboard_check(global.keyDash))
						{
							sprite_index = sprDashKick1;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, sndVoiceWallKick, 0, 0);
						
							var wkEff = instance_create_depth(x + image_xscale * (bbox_right - bbox_left) / 2, y - 4, depth - 1, obj_flareSmall);
							wkEff.image_xscale = self.image_xscale;
							canJump = 0;
							hspd = 0;
							vspd = 0;
							hspd = -hDir*hDashKickSpd;
							vspd = -dashKickSpd;
							hDir = sign(hspd);
							dashKickFlyTime = dashKickFlyTimeMax;
							dashKickTime = dashKickTimeMax;
							canSlide = 0;
							hState = HorizontalState.H_MOVE_PASSIVE;
							vState = VerticalState.V_MOVE_UP;
							aState = ActionState.DASHKICK;
							if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						}
					
						//Wall kick
						if ((aState != ActionState.WALLKICK) && !(keyboard_check(global.keyDash)))
						{
							sprite_index = sprWallKick;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, sndVoiceWallKick, 0, 0);
						
							var wkEff = instance_create_depth(x + image_xscale * (bbox_right - bbox_left) / 2, y - 4, depth - 1, obj_flareSmall);
							wkEff.image_xscale = self.image_xscale;
							lastWallKickSide = hDir;
							canJump = 0;
							hspd = -hDir*hWallKickSpd;
							vspd = -wallKickSpd;
							wallKickTime = wallKickTimeMax;
							canSlide = 0;
							hState = HorizontalState.H_MOVE_PASSIVE;
							vState = VerticalState.V_MOVE_UP;
							aState = ActionState.WALLKICK;
							if (atkState != AttackState.A_NONE) atkState = AttackState.A_NONE;
						}
					}
				}
			}
			
			#endregion
		}
		
		if (sprite_index == sprJump2 && vspd >= 0) 
		{
			if (aState == ActionState.WALLKICK)
			{
				lastWallKickSide = 0;
				wallKickTime2 = 0;
				aState = ActionState.IDLE;
			}
			if (atkState < AttackState.A_STRICT_ATTACK)
			{
				sprite_index = sprJump3;
				image_index = 0;
			}		
		}
		
		//End jump
		if (keyboard_check_released(global.keyJump) && !(aState == ActionState.WALLKICK))
		{
			if (vState != VerticalState.V_ON_GROUND) 
			{
				if (vState == VerticalState.V_MOVE_FALLING)
				{
					if (vspd < 0)
					{
						if (atkState < AttackState.A_STRICT_ATTACK)
						{
							if (sprite_index == sprJump2)
							{
								sprite_index = sprJump3;
								image_index = 0;
							}
						}
						vspd = 0;
					}
				}
			}
		}
		#endregion
	}
	
	#endregion
	//*********************************************************************************************************
	
}

else
{
	if (aState == ActionState.DYING)
	{
		if (timeWaitToDestroy > 0) timeWaitToDestroy -= DELTA_TIME;
		else	instance_destroy();
	}
	if (aState == ActionState.BEAMUP)
	{
		if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
		{
			instance_destroy();
		}
	}
	if (aState == ActionState.BEAMDOWN)
	{
		if (yBeam != -1)
		{
			if ((yBeam - y) <= (bbox_bottom - bbox_top))
				activateState = ActivateState.HALF_ACTIVATE;
		}
		else
		{
			if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
			{
				if (!place_meeting(x, y, obj_block))
				{
					activateState = ActivateState.HALF_ACTIVATE;
				}
			}
		}
	}
	
	x += hspd * DELTA_TIME;
	y += vspd * DELTA_TIME;
}