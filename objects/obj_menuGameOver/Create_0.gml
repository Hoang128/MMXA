/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Initialize parameter
font = fnt_UIBoldSmall;
lineNumber = 2;
background = c_dkgray;
lineSpace = 72;
xStartSpace = 16;
yStartSpace = 16;
width = 320;
height = 240;
haveEndEff = 1;
haveDesEff = 1;
haveStartAnim = 0;
parent = noone;
lastRoom = room_start;
visibleWhenDeactivate = true;

lineContext[0] = "GAME OVER";
lineContext[1] = "Back to title screen";
lineContext[2] = "Load save file";
scr_InitMenuProp();

lineEnable[2] = false;

cursor = 1;

var ins = instance_create_depth(16, 580, depth, obj_menuTextboxInstruction);
ins.width = 1280 - 16 * 2;
ins.height = 720 - 16 - (y + height + 16);