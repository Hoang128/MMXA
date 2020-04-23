/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/// @description Init

// Inherit the parent event
event_inherited();

//Initialize parameter
font = fnt_UIBoldSmall;
lineNumber = 14;
lineNumberVisible = 8;
background = c_dkgray;
//backgroundAlpha = 0.5;
lineSpace = 48;
xStartSpace = 64;
yStartSpace = 16;
height = 720 - 16 * 2;
xStartSpinner = 640;
parent = obj_menuOption;
visibleWhenDeactivate = true;
xKeyContext = 640;
charConfiguration = 0;

lineContext[0] = "KEYBOARD CONFIGURATIONS";

lineContext[1] = "Move up";
lineContext[2] = "Move down";
lineContext[3] = "Move left";
lineContext[4] = "Move right";
lineContext[5] = "Normal attack";
lineContext[6] = "Special attack";
lineContext[7] = "Jump";
lineContext[8] = "Dash";
lineContext[9] = "Giga attack";
lineContext[10] = "Character key 1";
lineContext[11] = "Character key 2";
lineContext[12] = "Change weapon L";
lineContext[13] = "Change weapon R";
lineContext[14] = "Map";

for (var i = 1; i <= 14; i++)
{
	keyChangeContext[i] = instance_create_depth(xKeyContext, 0, depth - 1, obj_keyChangeContext);
	keyChangeContext[i].keyId = i;
	keyChangeContext[i].core = self;
}
scr_InitMenuProp();