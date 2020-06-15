/// @description Insert description here
// You can write your code in this editor

phase = 0;
phaseMax = 2;
activePlayerWhenDie = true;

if (instance_exists(obj_gameManager.playerCore))
{
	obj_gameManager.playerCore.activateState = ActivateState.HALF_ACTIVATE;
}