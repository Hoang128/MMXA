/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collisionSFX = snd_RWeaponColEnemyEff;
collisionEff = obj_BusterColEffLv2;

maxTimmer = 5;
damage = 4;

core = noone;
init = false;

imgSpd = 0.5;

audio_play_sound_on(global.SFX_Emitter, snd_NovaStrikeEff, false, false);