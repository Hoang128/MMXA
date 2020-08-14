/// @description Intialize scr_playerXImpactAttack: scr_playerXImpactAttack(time, objPerform)
/// @function Intialize scr_playerXImpactAttack: scr_playerXImpactAttack
/// @param time time player in impact attack sprite
/// @param objPerform object that perform the attack

var time = argument0;
var objPerform = argument1;

sprite_index = sprImpactAtk;
image_index = 0;
activateState = ActivateState.HALF_ACTIVATE;
aState = ActionState.SP_MOVE;
hState = HorizontalState.H_MOVE_NONE;
if (vState != VerticalState.V_ON_GROUND)
	vState = VerticalState.V_MOVE_NONE;
hspd = 0;
vspd = 0;
dashSpd = 0;
dashTime = 0;
impactAtkTime = time;

if (objPerform != noone)
	instance_create_depth(x, y, depth, objPerform);