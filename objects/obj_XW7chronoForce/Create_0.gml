/// @description Insert description here
// You can write your code in this editor
event_inherited();

phase = 1;

audio_play_sound_on(global.SFX_Emitter, snd_SlowTimeEff, false, false);

time = 0;
timeExist = 600;

core = obj_gameManager.playerCore;
xPlace = (core.bbox_right + core.bbox_left) / 2;
yPlace = (core.bbox_top + core.bbox_bottom) / 2;

timeFSurf = noone;
radius = 1;
radiusMax = 64;
rSpd = 8;

surfW = 1;
surfH = 1;

image_xscale = 0;
image_yscale = 0;

depth = core.depth - 2;

alarm[0] = 1;