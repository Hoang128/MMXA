/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Initialize parameter
font = fnt_UIBoldSmall;
lineNumber = 4;
background = c_dkgray;
lineSpace = 72;
xStartSpace = 16;
yStartSpace = 16;
width = 256;
height = 720 - 16 - 16;
haveEndEff = 0;
haveDesEff = 1;
haveStartAnim = 0;
parent = noone;
backgroundAlpha = 0.5;
lastRoom = room_start;
visibleWhenDeactivate = true;

lineContext[0] = "MENU OPTION";
lineContext[1] = "Keyboard";
lineContext[2] = "Gamepad";
lineContext[3] = "Graphics";
lineContext[4] = "Sounds";