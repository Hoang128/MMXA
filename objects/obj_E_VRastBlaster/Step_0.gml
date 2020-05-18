/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	Init
state 1:	Idle
state 2:	Shot
state 3:	Init Move
state 3.1:	Move
state 4:	Init Spin
state 5:	Change to spin
state 5.1:  Spin
state 5.2:  Change to Idle
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_VRastBlasterIdle;
		image_index = 0;
		
		lastState = state;
		state = 1;
	}	break;
	
	case 1:
	{
		if (image_yscale != 1) 
			image_yscale = 1;
		if (idleTime < idleTimeMax)
		{
			idleTime += DELTA_TIME;
		}
		else
		{
			#region
			
			if (lastState != 0)
			{
				randomize();
				var r = random(5);
				switch (lastState)
				{
					case 2:
					{
						#region
						
						if (r < 1)
						{
							sprite_index = spr_VRastBlasterShot;
							image_index = 0;
						
							state = 2;
							break;
						}
						else if (r < 3)
						{
							state = 3;
							break;
						}
						else
						{
							state = 4;
							break;
						}
						
						#endregion
					}
					
					case 3.1:
					{
						#region
						
						if (r < 1)
						{
							sprite_index = spr_VRastBlasterMove1;
							image_index = 0;
							
							state = 3;
							break;
						}
						else if (r < 3)
						{
							sprite_index = spr_VRastBlasterShot;
							image_index = 0;
						
							state = 2;
							break;
						}
						else
						{
							state = 4;
							break;
						}
						
						#endregion
					}
					
					case 5.2:
					{
						#region
						
						if (r < 1)
						{
							state = 4;
							break;
						}
						else if (r < 3)
						{
							sprite_index = spr_VRastBlasterMove1;
							image_index = 0;
							
							state = 3;
							break;
						}
						else
						{
							sprite_index = spr_VRastBlasterShot;
							image_index = 0;
						
							state = 2;
							break;
						}
						
						#endregion
					}
				}
			}
			else
			{
				#region
				
				var r = random(3);
				if (r < 1)
				{
					sprite_index = spr_VRastBlasterShot;
					image_index = 0;
						
					state = 2;
					break;
				}
				else if (r < 2)
				{
					state = 3;
					break;
				}
				else
				{
					state = 4;
					break;
				}
				
				#endregion
			}
			
			#endregion
		}
	}	break;
	
	case 2:
	{
		if (image_index >= 7)
		{
			if (shot == false)
			{
				var bullet = instance_create_depth(x - 32 * image_xscale, y, depth - 1, obj_E_RastBlasterBullet);
				bullet.image_xscale = image_xscale;
				if (instance_exists(obj_gameManager.playerCore) && bullet.image_xscale == sign(self.x - obj_gameManager.playerCore.x))
					bullet.track = true;
				else
					bullet.track = false;
				shot = true;
			}
		}
	}	break;
	
	case 3:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			var yDef = abs (self.y - (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2);
			if (yDef == 0) yDef = 1;
			if ((collision_rectangle(x + image_xscale, y - sign(yDef) * stepDistance + abs (bbox_top - bbox_bottom) / 2, x + 2 * image_xscale, y - sign(yDef) * stepDistance - abs (sprite_height) / 2, obj_block, false, false))
			&& !(collision_rectangle(x - image_xscale * abs(bbox_right - bbox_left), y - sign(yDef) * stepDistance + abs (sprite_height) / 2, x - image_xscale, y - sign(yDef) * stepDistance - abs (sprite_height) / 2, obj_block, false, false)))
			{
				sprite_index = spr_VRastBlasterMove1;
				image_index = 0;
				image_yscale = sign(yDef);
				
				state = 3.1;
				break;
			}
			else
			{
				if ((collision_rectangle(x + image_xscale, y + sign(yDef) * stepDistance + abs (bbox_top - bbox_bottom) / 2, x + 2* image_xscale + 1, y + sign(yDef) * stepDistance - abs (sprite_height) / 2, obj_block, false, false))
				&& !(collision_rectangle(x - image_xscale * abs(bbox_right - bbox_left), y + sign(yDef)* stepDistance + abs (sprite_height) / 2, x - image_xscale, y + sign(yDef)* stepDistance - abs (sprite_height) / 2, obj_block, false, false)))
				{
					sprite_index = spr_VRastBlasterMove1;
					image_index = 0;
					image_yscale = -sign(yDef);
				
					state = 3.1;
					break;
				}
				else
				{
					state = 1;
					break;
				}
			}
		}
	}
	
	case 4:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			var yDef = (self.y - (obj_gameManager.playerCore.bbox_top + obj_gameManager.playerCore.bbox_bottom) / 2);
			if (yDef == 0) yDef = 1;
			if (!collision_rectangle(x - image_xscale, y - sign(yDef) * 14, x - image_xscale * (bbox_right - bbox_left), y - sign(yDef) * 16, obj_block, false, true)
			&&   collision_rectangle(x + image_xscale, y - sign(yDef) * 14, x + 2 * image_xscale, y - sign(yDef) * 16, obj_block, false, true))
			{
				sprite_index = spr_VRastBlasterChangeToSpin;
				image_index = 0;
				image_yscale = sign(yDef);
				
				state = 5;
				
				break;
			}
			else
			{
				if (!collision_rectangle(x - image_xscale, y + sign(yDef) * 14, x - image_xscale * (bbox_right - bbox_left), y + sign(yDef) * 16, obj_block, false, true)
				&&   collision_rectangle(x + image_xscale, y + sign(yDef) * 14, x + 2 * image_xscale, y + sign(yDef) * 16, obj_block, false, true))
				{
					sprite_index = spr_VRastBlasterChangeToSpin;
					image_index = 0;
					image_yscale = -sign(yDef);
				
					state = 5;
					break;
				}
				else
				{
					state = 1;
					break;
				}
			}
		}
	}	break;
	
	case 5.1:
	{
		if (spinTime < spinTimeMax)
		{
			if (image_xscale == 1)
			{
				if (place_meeting(bbox_right - 1, y - image_yscale * 8, obj_block) || !place_meeting(bbox_right + 2, y - image_yscale * 8, obj_block))
				{
					sprite_index = spr_VRastBlasterChangeToIdle;
					image_index = 0;
			
					spinTime = 0;
					idleTime = 0;
					vspd = 0;
					state = 5.2;
				
					break;
				}
				else
				{
					spinTime += DELTA_TIME;
					vspd = -image_yscale * spinSpd;
				}
			}
			if (image_xscale == -1)
			{
				if (place_meeting(bbox_left + 1, y - image_yscale * 8, obj_block) || !place_meeting(bbox_left - 2, y - image_yscale * 8, obj_block))
				{
					sprite_index = spr_VRastBlasterChangeToIdle;
					image_index = 0;
			
					spinTime = 0;
					idleTime = 0;
					vspd = 0;
					state = 5.2;
				
					break;
				}
				else
				{
					spinTime += DELTA_TIME;
					vspd = -image_yscale * spinSpd;
				}
			}
			
		}
		else
		{
			sprite_index = spr_VRastBlasterChangeToIdle;
			image_index = 0;
			
			spinTime = 0;
			idleTime = 0;
			vspd = 0;
			state = 5.2;
			
			break;
		}
	}	break;
}