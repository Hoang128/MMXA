/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

glow = 1;
imgSpd = 0.5;
busterObject = obj_PlasmaBuster;
frameShot = 4;

audio_play_sound_on(global.SFX_Emitter, snd_XBusterCharge2, 0, 0);

followPlayer = false;