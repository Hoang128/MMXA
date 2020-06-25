/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

font = fnt_UIMedium;
lineSpace = 56;
background = 1;

haveStartAnim = true;
animPhase = 0;
animXPixelSpd = 128;

xEndSpace = 8;
borderSpace = 32;
widthMax = VIEW_WIDTH - borderSpace * 2;
heightMax = 180;
width = 0;
height = 0;
lineW = 0;

bustShotImg = noone;
bustShot = fa_left;
bustShotX = 8;
bustShotY = heightMax - 8;
bustShotW = 192;
bustShotXScale = 0;
bustShotYScale = 0;
bustShotAnimSpd = 0.2;

phase = 0;
init = 0;

x = borderSpace;
y = borderSpace;
lineW = borderSpace + widthMax - (x + 2 * bustShotX + bustShotW) - xEndSpace * 2;

contextRevealSpd = 0.5;
charCursor = 0;
charCursorMax = 0;
contextNumber = 1;
contextCurrent = 0;
messageIndex = "";
lineContext[0] = "Test";