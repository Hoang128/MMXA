/// @description Move

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive**************************************************************************************************
	#region
	
	//Collision------------------------------------------------------------------------------------------------
	#region
	//Horizontal
	if (place_meeting(x + hspd, y, obj_block))
	{
		while(!place_meeting(x + sign(hspd), y, obj_block))
		{
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd * global.deltaTime;
	
	//Vertical
	if (place_meeting(x, y + vspd, obj_block))
	{
		while(!place_meeting(x, y + sign(vspd), obj_block))
		{
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd * global.deltaTime;
	#endregion
	
	//Gravity--------------------------------------------------------------------------------------------------
	#region
	if (place_meeting(x, y + 1, obj_block))
	{
		vspd = 0;
		if (vState != VerticalState.V_ON_GROUND)
		{
			sprite_index = sprLand;
			image_index = 0;
			
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
				vspd += grav * global.deltaTime;
		}
		if (vState == VerticalState.V_ON_GROUND)
		{
			sprite_index = sprJump3;
			image_index = 0;
			    
			aState = ActionState.IDLE;
			vState = VerticalState.V_MOVE_FALLING;
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
					vState = VerticalState.V_MOVE_FALLING;
				}
			}
		}
	}
	#endregion
	
	//Wall kick && Dash kick-----------------------------------------------------------------------------------
	#region
	
	if (aState == ActionState.DASHKICK)
	{
		if (dashKickFlyTime <= 0)
		{
			sprite_index = sprJump3;
			image_index = 0;
			
			hState = HorizontalState.H_MOVE_NONE;
			vState = VerticalState.V_MOVE_FALLING;
			aState = ActionState.JUMPDASHING;
		}
		else
		{
			dashKickFlyTime -= global.deltaTime;
		}
		
		if (hState == HorizontalState.H_MOVE_PASSIVE)
		{
			if (place_meeting(x, y - 1, obj_block))
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
				dashKickTime -= global.deltaTime;
			}
		}
	}
	
	if (aState == ActionState.WALLKICK)
	{
		if (hState == HorizontalState.H_MOVE_PASSIVE)
		{
			if ((wallKickTime <= 0) || place_meeting(x, y - 1, obj_block))
			{
				sprite_index = sprJump2;
				image_index = 0;

				hspd = 0;
				canSlide = 1;
				hState = HorizontalState.H_MOVE_NONE;
				vState = VerticalState.V_MOVE_FALLING;
			}
			else if (wallKickTime > 0) wallKickTime -= global.deltaTime;
		}
	}
	
	#endregion



	#endregion
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
			if((aState != ActionState.DASHING) && (aState != ActionState.CLIMBING))
			{
				if (aState != ActionState.DUCKING)
				{
					if (!place_meeting(x + hDir, y, obj_block))
					{
						//Jump dash
						if (aState == ActionState.JUMPDASHING)
						{
							hDir = hMove;
							hspd = hDir * dashSpdPhase2;
							hState = HorizontalState.H_MOVE_FORWARD;
						}
						
						//Wall kick
						else if (aState == ActionState.WALLKICK)
						{
							if (hState != HorizontalState.H_MOVE_PASSIVE)
							{
								hDir = hMove;
								hspd = hDir * runSpd;
								hState = HorizontalState.H_MOVE_FORWARD;
							}
						}
						
						//Dash kick
						else if (aState == ActionState.DASHKICK)
						{
							if (hState != HorizontalState.H_MOVE_PASSIVE)
							{	
								hDir = hMove;
								hspd = hDir * dashSpdPhase2;
								hState = HorizontalState.H_MOVE_FORWARD;
							}
						}
						
						//Run
						else
						{
							hDir = hMove;
							if (sprite_index == sprStand || sprite_index == sprLand || sprite_index == sprDash3)
							{
								sprite_index = sprRunStart;
								image_index = 0;
							}
							hspd = hDir * runSpd;
							hState = HorizontalState.H_MOVE_FORWARD;
						}
					}
					else
					{
						hDir = hMove;
						
						//Stop run if see wall
						if (vState == VerticalState.V_ON_GROUND)
						{
							if (sprite_index == sprRun || sprite_index == sprRunStart)
							{
								sprite_index = sprRunEnd;
								image_index = 0;
							}
					
							hspd = 0;
							hState = HorizontalState.H_MOVE_NONE;
						}
						else
						{
							//Slide
							if(weight != WeighType.MASSIVE)
							{
								if (atkState < AttackState.A_STRICT_ATTACK)
								{
									if ((aState != ActionState.SLIDING) && (canSlide))
									{
										sprite_index = sprSlide1;
										image_index = 0;
										
										if (!canAirDash) canAirDash = 1;
										vState = VerticalState.V_MOVE_DOWN;
										aState = ActionState.SLIDING;
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
				if (hMove * hDir < 0)
				{	
					hspd = 0;
					hDir = hMove;
					if (vState == VerticalState.V_MOVE_NONE)
					{
						sprite_index = sprJump3;
						image_index = 0;
						vState = VerticalState.V_MOVE_FALLING;
					}
					else
					{
						sprite_index = sprDash3;
						image_index = 0;
					}
					aState = ActionState.IDLE;
				}
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
				}
			}
		}
		
		#endregion
		
		//Key Down---------------------------------------------------------------------------------------------	
		#region
		
		if (keyboard_check(global.keyDown))
		{
			//Duck
			if (vState == VerticalState.V_ON_GROUND)
			{
				if (aState == ActionState.IDLE)
				{
					sprite_index = sprDuck1;
					image_index = 0;
				
					hspd = 0;
					hState = HorizontalState.H_MOVE_NONE;
					aState = ActionState.DUCKING;
				}
			}
		}
		
		if (keyboard_check_released(global.keyDown))
		{
			//Unduck
			if (vState == VerticalState.V_ON_GROUND)
			{
				if (aState == ActionState.DUCKING)
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
		
		#endregion
		
		//Dashing----------------------------------------------------------------------------------------------
		#region
		
		//Start dash
		if (keyboard_check_pressed(global.keyDash) && (!place_meeting(x + hDir, y, obj_block)))
		{
			if (aState != ActionState.CLIMBING && atkState != AttackState.A_STRICT_ATTACK)
			{
				if (aState != ActionState.JUMPDASHING)
				{
					if (vState != VerticalState.V_ON_GROUND)
					{
						if (canAirDash)
						{
							sprite_index = sprDash1;
							image_index = 1;
							
							dashPhase = 1;
							dashTime = maxDashTime;
							vspd = 0;
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
						hState = HorizontalState.H_MOVE_FORWARD;
						aState = ActionState.DASHING;
					}
				}
			}
		}
		
		//Dash time decrease
		if (aState == ActionState.DASHING)
		{
			hspd = dashSpd * hDir;
			if (dashTime > 0) dashTime--;
		}
		
		//Dash phase speed
		switch dashPhase
		{
			case 1: dashSpd = dashSpdPhase1; break;
			case 2: dashSpd = dashSpdPhase2; break;
			default: dashSpd = 0; break;
		}
		
		//End dash
		if (keyboard_check_released(global.keyDash) || (dashTime == 0) || (place_meeting(x+hDir, y, obj_block)))
		{
			if (aState == ActionState.DASHING)
			{
				hspd = 0;
				if (vState != VerticalState.V_ON_GROUND)
				{
					sprite_index = sprJump3;
					image_index = 0;
					
					dashPhase = 0;
					vState = VerticalState.V_MOVE_FALLING;
				}
				else
				{
					sprite_index = sprDash3;
					image_index = 0;
					
					dashPhase = 0;
				}
				aState = ActionState.IDLE;
				hState = HorizontalState.H_MOVE_NONE;
			}
		}
		
		#endregion
		
		//Default jumping---------------------------------------------------------------------------------------
		#region
		
		//Start jump
		if (keyboard_check_pressed(global.keyJump))
		{
			//Normal jump
			#region
			
			if (vState == VerticalState.V_ON_GROUND)
			{
				sprite_index = sprJump1;
				image_index = 0;
				
				vspd -= jumpSpd;
				if (keyboard_check(global.keyDash))
				{
					aState = ActionState.JUMPDASHING;
				}
				else
					aState = ActionState.IDLE;
				vState = VerticalState.V_MOVE_FALLING;
			}
			
			#endregion
			
			//Wall kick
			#region
			
			else
			{
				if ((aState == ActionState.SLIDING) || (place_meeting(x + hDir, y, obj_block) && canSlide))
				{
					//Dash kick
					if ((aState != ActionState.DASHKICK) && keyboard_check(global.keyDash))
					{
						sprite_index = sprDashKick1;
						image_index = 0;
						
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
					}
					
					//Wall kick
					if ((aState != ActionState.WALLKICK) && !(keyboard_check(global.keyDash)))
					{
						sprite_index = sprWallKick;
						image_index = 0;
						
						hspd = -hDir*hWallKickSpd;
						vspd = -wallKickSpd;
						wallKickTime = wallKickTimeMax;
						canSlide = 0;
						hState = HorizontalState.H_MOVE_PASSIVE;
						vState = VerticalState.V_MOVE_UP;
						aState = ActionState.WALLKICK;
					}
				}
			}
			
			#endregion
		}
		
		if (sprite_index == sprJump2 && vspd >= 0) 
		{
			if (aState == ActionState.WALLKICK)
				aState = ActionState.IDLE;
			sprite_index = sprJump3;
			image_index = 0;
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
						sprite_index = sprJump3;
						vspd = 0;
					}
				}
			}
		}
		#endregion
	}
	
	#endregion
	
}