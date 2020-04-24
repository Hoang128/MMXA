/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

contextNumber = 2;

soundConfirm = snd_UISelect;
soundMove = snd_UISelectChange;
font = fnt_UIBoldSmall;
triangleSpace = 128;
triangleWidth = 20;
triangleHeight = 32;
line = 1;
parent = obj_menuGraphics;
context[0] = "Window";
context[1] = "Fullscreen";

if (window_get_fullscreen() == true)
	cursor = 1;
else
	cursor = 0;