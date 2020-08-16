/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collisionSFX = snd_MWeaponColEnemyEff;
maxTimmer = 2;
damage = 1;
type = WeaponType.SABER;
slowTime = true;

createFlameObj = false;

audio_play_sound_on(global.SFX_Emitter, snd_ZFlameSaberEff, false ,false);