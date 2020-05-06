/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

glow = 1;
imgSpd = 0.5;
damage = 1;
damageRed = 0;
moveSpd = 3;
var xx = (obj_gameManager.playerCore.bbox_right + obj_gameManager.playerCore.bbox_left) / 2;
var yy = (obj_gameManager.playerCore.bbox_bottom + obj_gameManager.playerCore.bbox_top) / 2;
direction = point_direction(self.x, self.y, xx, yy);