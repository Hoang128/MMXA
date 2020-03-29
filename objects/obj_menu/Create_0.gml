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

lineContext[0] = "";
lineContext[1] = "Start";
lineContext[2] = "Continue";
lineContext[3] = "Option";

//Initialize inside variables
cursor = 1;
active = 1;
init = 0;

scr_InitMenuProp();