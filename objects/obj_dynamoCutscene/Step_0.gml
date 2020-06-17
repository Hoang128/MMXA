/// @description Insert description here
// You can write your code in this editor
switch(phase)
{
	case 0:
	{
		image_xscale = sign(X_VIEW + W_VIEW/2 - x);
		if (sprite_index == spr_dynamoBeam)
		{
			vspd = 6;
			if (!place_meeting(x, y, obj_block))
			{
				phase = 1;
			}
		}
	}	break;
	case 1:
	{
		if (place_meeting(x, y + vspd, obj_block))
		{
			move_contact_solid(270, 0);
			vspd = 0;
			sprite_index = spr_dynamoBeamDown;
			image_index = 0;
			phase = 2;
		}
	}	break;
	case 4:
	{
		sprite_index = spr_dynamoBeamDown;
		image_index = 8;
		phase = 5;
	}	break;
	case 5:
	{
		if (image_index < 1 )
		{
			sprite_index = spr_dynamoBeam;
			vspd = -6;
			phase = 6;
		}
	}	break;
	case 6:
	{
		scr_destroyObjOutOfCamera(self);
	}
}

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;