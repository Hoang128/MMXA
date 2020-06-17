/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var objL = instance_create_depth(x, y, depth, objLose);
objL.aliveAfterLose = self.aliveAfterLose;
objL.image_xscale = image_xscale;

scr_playerBackToIdle();

if (instance_exists(obj_bossHUD))
	instance_destroy(obj_bossHUD);