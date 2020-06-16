/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (init == true)
{
	switch (state)
	{
		case 0:
		{
			sprite_index = spr_dynamoStand;
			image_index = 0;
			state = 1;
		}	break;
	}
}