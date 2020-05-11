/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (backExecute || confirmExecute)
{
	switch (cursor)
	{
		case 0:
		{
			if (window_get_height() != 240) window_set_size(426, 240);
		}
		break;
		case 1:
		{
			if (window_get_height() != 360) window_set_size(640, 360);
		}
		break;
		case 2:
		{
			if (window_get_height() != 450) window_set_size(800, 450);
		}
		break;
		case 3:
		{
			if (window_get_height() != 540) window_set_size(960, 540);
		}
		break;
		case 4:
		{
			if (window_get_height() != 720) window_set_size(1280, 720);
		}
		break;
		case 5:
		{
			if (window_get_height() != 900) window_set_size(1600, 900);
		}
		break;
		case 6:
		{
			if (window_get_height() != 1080) window_set_size(1920, 1080);
		}
		break;
	}
	backExecute = false;
	confirmExecute = false;
}