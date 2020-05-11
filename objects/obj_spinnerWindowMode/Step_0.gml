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
			if (window_get_fullscreen() == true) 
			{
				window_set_fullscreen(false);
				global.fullScreen = false;
			}
		}
		break;
		case 1:
		{
			if (window_get_fullscreen() == false) 
			{
				window_set_fullscreen(true);
				window_set_size(global.wWidth, global.wHeight);
				global.fullScreen = true;
			}
		}
		break;
	}
	backExecute = false;
	confirmExecute = false;
}