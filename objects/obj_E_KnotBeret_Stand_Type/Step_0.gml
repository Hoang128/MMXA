/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*State
0: init
1: falling
2: stand
3: shot
3.1: shot up
3.2: throw bomb
*/

switch (state)
{
	case 0:
	{
		sprite_index = spr_knotBeretFall;
		image_index = 0;
		state = 1;
	}	break;

	case 1:
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			sprite_index = spr_knotBeretLand;
			image_index = 0;
			state = 2;
		}
	}	break;
	
	case 2:
	{
		if (sprite_index == spr_knotBeretStand)
		{
		}
	}	break;
}