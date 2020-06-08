/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	Init
state 1:	Walk
state 2:	Stand Shot
state 3.1:	Jump up
state 3.2:	Land down
state 4:	Jump shot
state 5:	Falling
state 6:	Jumping
*/

switch (state)
{
	case 0:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		if (place_meeting (x, y + 1, obj_block))
		{
			sprite_index = spr_walkCannonWalking;
			image_index = 0;
			
			state = 1;
		}
		else
		{
			sprite_index = spr_walkCannonJumpShotDown;
			image_index = 0;
			
			state = 5;
		}
	}	break;
	
	case 1:
	{
		if (walkTime < walkTimeMax)
		{
			walkTime += DELTA_TIME;
			hspd = moveSpd * image_xscale;
			if (image_xscale == 1)
			{
				if (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_block, false, false)
				|| !collision_rectangle(bbox_right, bbox_bottom, bbox_right + 1, bbox_bottom + 1, obj_block, false, false))
				{
					image_xscale = -1;
					hspd = image_xscale * moveSpd;
				}
			}
	
			if (image_xscale == -1)
			{
				if (collision_rectangle(bbox_left - 1, bbox_top, bbox_left, bbox_bottom, obj_block, false, false)
				|| !collision_rectangle(bbox_left - 1, bbox_bottom, bbox_left, bbox_bottom + 1, obj_block, false, false))
				{
					image_xscale = 1;
					hspd = image_xscale * moveSpd;
				}
			}
		}
		else
		{
			if (instance_exists(obj_gameManager.playerCore))
			{		
				if (distance_to_object(obj_gameManager.playerCore) > distanceToAct)
				{
					walkTime = 0;
				}
				else
				{
					if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
					else
					{
						image_xscale = sign(obj_gameManager.playerCore.x - self.x);
					}
					
					var rAct = random(2);
					if (rAct > 1)
					{
						if ((self.y - obj_gameManager.playerCore.y) > 16)
							sprite_index = spr_walkCannonShotUp;
						else
							sprite_index = spr_walkCannonShot;
						image_index = 0;
						
						hspd = 0;
						walkTime = 0;
						state = 2;
					}
					else
					{
						sprite_index = spr_walkCannonJump;
						image_index = 0;
						
						hspd = 0;
						walkTime = 0;
						state = 3.1;
					}
				}
			}
		}
	}	break;
	
	case 2:
	{
		if (shotTime < shotTimeMax)
		{
			shotTime += DELTA_TIME;
			if (shotBullet < (shotBulletMax + 1))
			{
				if (shotTime >= shotTimeMax/(shotBulletMax + 1)*shotBullet && shotTime < shotTimeMax/(shotBulletMax + 1)*shotBullet +  shotTimeMax/((shotBulletMax + 1) * 2 ))
				{
					if (bulletCreate == 0)
					{
						switch (sprite_index)
						{
							case spr_walkCannonShot:	
							{
								if (shotBullet % 2 == 1)
								{
									var bullet1 = instance_create_depth(x + 10 * image_xscale, y - 32, depth - 1, obj_E_WalkCannonBullet);
									bullet1.direction = 90 - 90 * image_xscale;
								}
								else
								{
									var bullet2 = instance_create_depth(x + 16 * image_xscale, y - 31, depth - 1, obj_E_WalkCannonBullet);
									bullet2.direction = 90 - 90 * image_xscale;
								}
							}	break;
							case spr_walkCannonShotUp:
							{
								if (shotBullet % 2 == 1)
								{
									var bullet1 = instance_create_depth(x + 5 * image_xscale, y - 35, depth - 1, obj_E_WalkCannonBullet);
									bullet1.direction = 90 - 60 * image_xscale;
								}
								else
								{
									var bullet2 = instance_create_depth(x + 12 * image_xscale, y - 34, depth - 1, obj_E_WalkCannonBullet);
									bullet2.direction = 90 - 60 * image_xscale;
								}
							}	break;
						}
						bulletCreate = 1;
						shotBullet++;
					}
				}
				
				if (shotTime >= shotTimeMax/(shotBulletMax + 1)*(shotBullet - 1) +  shotTimeMax/((shotBulletMax + 1) * 2 ) && (shotTime < shotTimeMax/(shotBulletMax + 1)*shotBullet))
				{
					if (shotBullet > 1)
					{
						bulletCreate = 0;
					}
				}
			}
		}
		else
		{
			sprite_index = spr_walkCannonWalking;
			image_index = 0;
			
			shotTime = 0;
			shotBullet = 1;
			bulletCreate = 0;
			state = 1;
		}
	}	break;
	
	case 4:
	{
		vspd = 0;
		if (shotTime < shotTimeMax)
		{
			shotTime += DELTA_TIME;
			if (shotBullet < (shotBulletMax + 1))
			{
				if (shotTime >= shotTimeMax/(shotBulletMax + 1)*shotBullet && shotTime < shotTimeMax/(shotBulletMax + 1)*shotBullet +  shotTimeMax/((shotBulletMax + 1) * 2 ))
				{
					if (bulletCreate == 0)
					{
						switch (sprite_index)
						{
							case spr_walkCannonJumpShotDown:
							{
								if (shotBullet % 2 == 1)
								{
									var bullet1 = instance_create_depth(x + 12 * image_xscale, y - 20, depth - 1, obj_E_WalkCannonBullet);
									bullet1.direction = 90 - 120 * image_xscale;
								}
								else
								{
									var bullet2 = instance_create_depth(x + 18 * image_xscale, y - 20, depth - 1, obj_E_WalkCannonBullet);
									bullet2.direction = 90 - 120 * image_xscale;
								}
							}	break;
							case spr_walkCannonJumpShotUp:
							{
								if (shotBullet % 2 == 1)
								{
									var bullet1 = instance_create_depth(x + 5 * image_xscale, y - 38, depth - 1, obj_E_WalkCannonBullet);
									bullet1.direction = 90 - 60 * image_xscale;
								}
								else
								{
									var bullet2 = instance_create_depth(x + 12 * image_xscale, y - 37, depth - 1, obj_E_WalkCannonBullet);
									bullet2.direction = 90 - 60 * image_xscale;
								}
							}	break;
						}
						bulletCreate = 1;
						shotBullet++;
					}
				}
				
				if (shotTime >= shotTimeMax/(shotBulletMax + 1)*(shotBullet - 1) +  shotTimeMax/((shotBulletMax + 1) * 2 ) && (shotTime < shotTimeMax/(shotBulletMax + 1)*shotBullet))
				{
					if (shotBullet > 1)
					{
						bulletCreate = 0;
					}
				}
			}
		}
		else
		{
			sprite_index = spr_walkCannonJumpShotDown;
			image_index = 0;
			
			shotTime = 0;
			shotBullet = 1;
			bulletCreate = 0;
			gravityAffected = true;
			state = 5;
		}
	}	break;
	
	case 5:
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			sprite_index = spr_walkCannonLand;
			image_index = 0;
			
			state = 3.2;
		}
	}	break;
	
	case 6:
	{
		if (hspd == 0)
		{
			if (!place_meeting(x, y + 1, obj_block) && abs(vspd) < (GRAVITY_AIR))
			{
				if (instance_exists(obj_gameManager.playerCore))
				{
					if ((self.y - obj_gameManager.playerCore.y) < 8)
						sprite_index = spr_walkCannonJumpShotDown;
					else
						sprite_index = spr_walkCannonJumpShotUp;
					image_index = 0;
					gravityAffected = false;
					state = 4;
				}
			}
		}
	}	break;
}