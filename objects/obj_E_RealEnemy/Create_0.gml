/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

distanceToParentLimit = W_ACTIVE_BOX;
physicAffected = false;
gravityAffected = false;
explosionPiece = 0;
pieceSprite = 0;
createExplosion = true;
maxDisDetectSlopeAbove = 4; //Distance to detect slope on the ground

depth = layer_get_depth(obj_gameManager.lEnemy);