/// @description Init

// Inherit the parent event
event_inherited();

//Initialize parameter
font = fnt_UIBoldMedium;
lineNumber = 3;
background = noone;
lineSpace = 64;
xStartSpace = 4;
yStartSpace = 4;
haveEndEff = true;

lineContext[0] = "";
lineContext[1] = "START";
lineContext[2] = "CONTINUE";
lineContext[3] = "OPTION";

scr_InitMenuProp();