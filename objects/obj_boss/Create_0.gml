/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 0;
hpMax = 64;

neutralArmor = 0;
darkArmor = 0;
fireArmor = 0;
iceArmor = 0;
electArmor = 0;

hitCounter = 0;
hitNumberMax = 2;

inviTime = 0;
inviTimeMax = 300;

bgm = bgm_X5VSBoss;
sprGainHp = noone;
objLose = noone;
gainHpSpd = 0.5;
aliveAfterLose = false;

init = false;

depth = layer_get_depth(obj_gameManager.lEnemy);