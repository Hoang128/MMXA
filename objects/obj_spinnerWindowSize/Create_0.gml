/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

contextNumber = 7;

soundConfirm = snd_UISelect;
soundMove = snd_UISelectChange;
font = fnt_UIBoldSmall;
triangleSpace = 128;
triangleWidth = 20;
triangleHeight = 32;
line = 2;
parent = obj_menuGraphics;
context[0] = "426 x 240";
context[1] = "640 x 360";
context[2] = "800 x 450";
context[3] = "960 x 540";
context[4] = "1280 x 720";
context[5] = "1600 x 900";
context[6] = "1920 x 1080";

switch(window_get_height())
{
	case 240:		cursor = 0;		break;
	case 360:		cursor = 1;		break;
	case 450:		cursor = 2;		break;
	case 540:		cursor = 3;		break;
	case 720:		cursor = 4;		break;
	case 900:		cursor = 5;		break;
	case 1080:		cursor = 6;		break;
}