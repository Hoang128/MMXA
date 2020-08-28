/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	Setup start direction
state 1:	Move out of blocks
state 2:	Wait for creeping
state 3:	Creeping
*/

checkCol.colC  = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_block, false, false);
checkCol.colT  = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top + moveSpd, obj_block, false, false);
checkCol.colB  = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + moveSpd, obj_block, false, false);
checkCol.colL  = collision_rectangle(bbox_left - 1, bbox_top, bbox_left - moveSpd, bbox_bottom, obj_block, false, false);
checkCol.colR  = collision_rectangle(bbox_right + 1, bbox_top, bbox_right + moveSpd, bbox_bottom, obj_block, false, false);
checkCol.col045 = collision_rectangle(bbox_right + 1, bbox_top - 1, bbox_right + moveSpd, bbox_top - moveSpd, obj_block, false, false);
checkCol.col135 = collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_left - moveSpd, bbox_top - moveSpd, obj_block, false, false);
checkCol.col315 = collision_rectangle(bbox_right + 1, bbox_bottom + 1, bbox_right + moveSpd, bbox_bottom + moveSpd, obj_block, false, false);
checkCol.col225 = collision_rectangle(bbox_left - 1, bbox_bottom + 1, bbox_left - moveSpd, bbox_bottom + moveSpd, obj_block, false, false);

switch (state)
{
	case 0:
	{
		direction = startDir;
		switch (direction)
		{
			case 0:		creepDir = 180;	break;
			case 90:	creepDir = 270;	break;
			case 180:	creepDir = 0;	break;
			case 270:	creepDir = 90;	break;
		}
		state = 1;
		
	}	break;
	case 1:
	{
		if (checkCol.colC == noone)
		{
			switch(startDir)
			{
				case 0:
				{
					if (instance_exists(obj_gameManager.playerCore))
					{
						if (self.y - obj_gameManager.playerCore.y > 0)
						{
							moveWiseClock = false;
							direction = 270;
						}
						else
						{
							moveWiseClock = true;
							direction = 90;
						}
					}	else	direction = 270;
				}	break;
				case 90:
				{
					if (instance_exists(obj_gameManager.playerCore))
					{
						if (self.x - obj_gameManager.playerCore.x > 0)
						{
							moveWiseClock = true;
							direction = 180;
						}
						else
						{
							moveWiseClock = false;
							direction = 0;
						}
					}	else	direction = 180;
				}	break;
				case 180:
				{
					if (instance_exists(obj_gameManager.playerCore))
					{
						if (self.y - obj_gameManager.playerCore.y > 0)
						{
							moveWiseClock = false;
							direction = 90;
						}
						else
						{
							moveWiseClock = true;
							direction = 270;
						}
					}	else	direction = 90;
				}	break;
				case 270:
				{
					if (instance_exists(obj_gameManager.playerCore))
					{
						if (self.x - obj_gameManager.playerCore.x > 0)
						{
							moveWiseClock = false;
							direction = 180;
						}
						else
						{
							moveWiseClock = true;
							direction = 0;
						}
					}	else	direction = 0;
				}	break;
			}
			speed = 0;
			state = 2;
		}
	}	break;
	case 2:
	{
		if (waitTime > 0)
			waitTime -= DELTA_TIME;
		else
		{
			speed = moveSpd;
			state = 3;
		}
	}	break;
	case 3:
	{
		switch (direction)
		{
			case 0:
			{
				if (moveWiseClock == true)
				{
					if (creepDir == 90)
					{
						if (!checkCol.colT && checkCol.col135)
						{
							direction = 90;
							creepDir = 180;
						}
						
						if (checkCol.colR)
						{
							direction = 270;
							creepDir = 0;
						}
					}
				}
				else
				{
					if (creepDir == 270)
					{
						if (!checkCol.colB && checkCol.col225)
						{
							direction = 270;
							creepDir = 180;
						}
						
						if (checkCol.colR)
						{
							direction = 90;
							creepDir = 0;
						}
					}
				}
			}	break;
			case 90:
			{
				if (moveWiseClock == true)
				{
					if (creepDir == 180)
					{
						if (!checkCol.colL && checkCol.col225)
						{
							direction = 180;
							creepDir = 270;
						}
						
						if (checkCol.colT)
						{
							direction = 0;
							creepDir = 90;
						}
					}
				}
				else
				{
					if (creepDir == 0)
					{
						if (!checkCol.colR && checkCol.col315)
						{
							direction = 0;
							creepDir = 270;
						}
						
						if (checkCol.colT)
						{
							direction = 180;
							creepDir = 90;
						}
					}
				}
			}	break;
			case 180:
			{
				if (moveWiseClock == true)
				{
					if (creepDir == 270)
					{
						if (!checkCol.colB && checkCol.col315)
						{
							direction = 270;
							creepDir = 0;
						}
						
						if (checkCol.colL)
						{
							direction = 90;
							creepDir = 180;
						}
					}
				}
				else
				{
					if (creepDir == 90)
					{
						if (!checkCol.colT && checkCol.col045)
						{
							direction = 90;
							creepDir = 0;
						}
						
						if (checkCol.colL)
						{
							direction = 270;
							creepDir = 180;
						}
					}
				}
			}	break;
			case 270:
			{
				if (moveWiseClock == true)
				{
					if (!checkCol.colR && checkCol.col045)
					{
						direction = 0;
						creepDir = 90;
					}
					
					if (checkCol.colB)
					{
						direction = 180;
						creepDir = 270;
					}
				}
				else
				{
					if (!checkCol.colL && checkCol.col135)
					{
						direction = 180;
						creepDir = 90;
					}
					
					if (checkCol.colB)
					{
						direction = 0;
						creepDir = 270;
					}
				}
			}	break;
		}
	}	break;
}

motion_set(direction, speed * DELTA_TIME);

var x_view = X_VIEW;
var y_view = Y_VIEW;
if (x_view < 0)
	x_view = 0;
if (y_view < 0)
	y_view = 0;

if (!collision_rectangle(x_view, y_view, x_view + W_VIEW, y_view + H_VIEW, self, false, false))
{
	createExplosion = false;
	instance_destroy();
}