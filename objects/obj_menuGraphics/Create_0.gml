/// @description Init

// Inherit the parent event
event_inherited();

//Initialize parameter
font = fnt_UIBoldSmall;
lineNumber = 2;
background = c_dkgray;
lineSpace = 128;
xStartSpace = 64;
yStartSpace = 16;
height = 720 - 16 * 2;
xStartSpinner = 768;
parent = obj_menuOption;
visibleWhenDeactivate = true;

lineContext[0] = "GRAPHICS CONFIGURATIONS";
lineContext[1] = "Window mode: ";
lineContext[2] = "Window size: ";


spinner[0] = instance_create_depth(xStartSpinner, yStartSpace + 1 * lineSpace + 18, depth - 1, obj_spinnerWindowMode);
spinner[0].line = 1;

spinner[1] = instance_create_depth(xStartSpinner, yStartSpace + 2 * lineSpace + 18, depth - 1, obj_spinnerWindowSize);
spinner[1].line = 2;

/*
spinner[2] = instance_create_depth(xStartSpinner, yStartSpace + 3 * lineSpace + 18, depth - 1, obj_soundSpinner);
spinner[2].parameter = global.BGMVolume;
spinner[2].line = 3;

scr_InitMenuProp();