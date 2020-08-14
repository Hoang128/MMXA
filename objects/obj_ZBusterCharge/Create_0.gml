/// @description Insert description here
// You can write your code in this editor
event_inherited();

damage = 5;
collisionSFX = snd_RWeaponColEnemyEff;
collisionEff = obj_BusterColEffLv2;
flyTime = 20;
moveSpd = 8;
maxTimmer = 4;
createEff = false;
imgSpd = 0.5;
effWidthNumber = 4;
effWidthRange = (bbox_bottom - bbox_top) / (effWidthNumber - 1);

timmer = maxTimmer;

init = false;