/// @description Move

if (activateState != ActivateState.DEACTIVATE)
{
	//Active***************************************************************************************************
	#region
	if (activateState == ActivateState.ACTIVATE)
	{
		//Running----------------------------------------------------------------------------------------------
		#region
		var hMoveL = keyboard_check(global.keyLeft);
		var hMoveR = keyboard_check(global.keyRight);
		
		var hMove = hMoveR - hMoveL;
		if (hMove != 0)
		{
			//Normal run
			if(aState != ActionState.DASHING && aState != ActionState.CLIMBING)
			{
				hDir = hMove;
				if (!place_meeting(x + hDir, y, obj_block))
				{
					if (aState == ActionState.JUMPDASHING)
						hspd = hMove * dashSpdPhase2;
					else
					{
						if (sprite_index == sprStand || sprite_index == sprLand || sprite_index == sprDash3)
						{
							sprite_index = sprRunStart;
							image_index = 0;
						}
					
						hspd = hMove * runSpd;
					}
					hState = HorizontalState.H_MOVE_FORWARD;
				}
				else
				{
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
						if(weight != WeighType.MASSIVE)
						{
							if (atkState < AttackState.A_STRICT_ATTACK)
							{
								if ((aState != ActionState.SLIDING) && (canSlide))
								{
									sprite_index = sprSlide1;
									image_index = 0;
										
									vState = VerticalState.V_MOVE_DOWN;
									aState = ActionState.SLIDING;
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
			if(hState == HorizontalState.H_MOVE_FORWARD)
			{
				if(aState != ActionState.DASHING)
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
		
		//Normal jumping----------------------------------------------------------------------------------------------
		#region
		//Start jump
		if (keyboard_check_pressed(global.keyJump))
		{
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
		}
		
		if (sprite_index == sprJump2 && vspd >= 0) 
		{
			sprite_index = sprJump3;
			image_index = 0;
		}
		
		//End jump
		if (keyboard_check_released(global.keyJump))
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
	
	//Passive**************************************************************************************************
	#region
	
	//Collision
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
	
	//Gravity
	#region
	if (place_meeting(x, y+1, obj_block))
	{
		vspd = 0;
		if (vState != VerticalState.V_ON_GROUND)
		{
			sprite_index = sprLand;
			image_index = 0;
			
			canSlide = 0;
			vState = VerticalState.V_ON_GROUND;
			if (aState == ActionState.JUMPDASHING)
			{
				if (dashPhase > 0)
				{
					dashSpd = 0;
					dashPhase = 0;
				}
				aState = ActionState.IDLE;
			}
			if (!canAirDash)
				canAirDash = 1;
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
				vspd = slideSpd;
				
				if ((place_meeting(x, y + minSlideHeigh, obj_block)) || (!place_meeting(x + hDir, y, obj_block)))
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
	
	#endregion
}