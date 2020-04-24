/// @description Init

//Initialize parameter
depth = -1000;
font = fnt_UIBig;
lineNumber = 3;
lineNumberVisible = -1;
lineVisibleTop = 1;
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
backgroundAlpha = 0.75;
visibleWhenDeactivate = false;
lastRoom = noone;
backHandle = false;
backExecute = false;
soundConfirm = snd_UISelect;
soundMove = snd_UISelectChange;
shadow = 1;
shadowDistance = 4;
triangleSpace = 32;
triangleWidth = 32;
triangleHeight = 16;

lineContext[0] = "";
lineContext[1] = "Start";
lineContext[2] = "Continue";
lineContext[3] = "Option";

//Initialize inside variables
cursor = 1;
active = 1;
init = 0;

scr_InitMenuProp();