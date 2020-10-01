/// @description Insert description here
// You can write your code in this editor
if (init == 0)
{

	init = 1;
}
else
{
	scr_destroyObjOutOfCamera(self);
	motion_set(direction, moveSpd * DELTA_TIME);
	
	switch (direction)
	{
		case 0:
		{
			if (place_meeting(x + moveSpd * DELTA_TIME, y, obj_block))
				direction = 90;
		}	break;
		
		case 90:
		{
			if (place_meeting(x, y - moveSpd * DELTA_TIME, obj_block))
				instance_destroy();
		}	break;
		
		case 180:
		{
			if (place_meeting(x - moveSpd * DELTA_TIME, y, obj_block))
				direction = 90;
		}	break;
		
		case 270:
		{
		}	break;
		
		default:
		{
			show_message("Direction illegal!");
		}	break;
	}
}