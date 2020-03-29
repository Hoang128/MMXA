/// @description Init

//Initialize parameter
font = fnt_UIBig;
lineNumber = 3;
background = 0;
lineSpace = 16;
xStartSpace = 4;
yStartSpace = 4;
width = 360;
height = 360;
haveEndEff = 0;
haveDesEff = 0;
haveStartAnim = 0;
parent = noone;
backgroundAlpha = 0.8;
visibleWhenDeactivate = false;
lastRoom = noone;
backHandle = false;
backExecute = false;
soundConfirm = snd_UISelect;
soundMove = snd_UISelectChange;

lineContext[0, 0] = "KEYBOARD CONFIGURARTION";
lineContext[1, 0] = "KEYBOARD CONFIGURARTION";
lineContext[0, 1] = "Move up";
lineContext[0, 2] = "Move down";
lineContext[0, 3] = "Move left";
lineContext[0, 4] = "Move right";
lineContext[0, 5] = "Normal attack";
lineContext[0, 6] = "Special attack";
lineContext[0, 7] = "Form attack";
lineContext[1, 1] = "Jump";
lineContext[1, 2] = "Dash";
lineContext[1, 3] = "Changle L";
lineContext[1, 4] = "Changle R";
lineContext[1, 5] = "Giga attack";
lineContext[1, 6] = "Map";
lineContext[1, 7] = "Back to menu";

//Initialize inside variables
cursor = 1;
active = 1;
init = 0;

scr_InitMenuProp();