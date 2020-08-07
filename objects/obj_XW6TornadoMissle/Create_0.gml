/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 1;
target = noone;
init = false;
firstDir = 0;
spd = 1.5;
phase = 1;
nonTargetTime = 0;
nonTargetTimeMax = 30;
targetList = ds_list_create();
createOrb = false;
dir = 1;

createWindMax = 100;
createWindTime = createWindMax;
constBalance = createWindMax * spd;

collisionSFX = snd_RWeaponColEnemyEff;
collisionEff = obj_BusterColEffLv1;

audio_play_sound_on(global.SFX_Emitter, snd_XSkill6TornadoMissleStart, false, false);