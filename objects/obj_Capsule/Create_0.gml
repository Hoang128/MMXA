/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

phase = 0;
imgSpd = 0.25;

greenF = instance_create_depth(x, y, depth - 2, obj_CapsuleGreenField);
greenF.core = self;

waitTime = 0;
waitDrLightPRJTimeMax = 30;
waitDrLightPRJToTalk  = 60;