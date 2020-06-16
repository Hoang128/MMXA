/// @description Insert description here
// You can write your code in this editor
switch(phase)
{
	case 0:
	{
		image_xscale = sign(X_VIEW + W_VIEW/2 - x);
		if (sprite_index == spr_dynamoBeam)
		{
			vspd = 2;
			if (!place_meeting(x, y, obj_block))
			{
				phase = 1;
			}
		}
	}	break;
	case 1:
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			vspd = 0;
			sprite_index = spr_dynamoBeamDown;
			image_index = 0;
			phase = 2;
		}
	}	break;
}

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;