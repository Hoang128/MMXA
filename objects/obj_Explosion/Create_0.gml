/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

glow = 1;
imgSpd = 0.5;

if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + RESOLUTION_WIDTH, Y_VIEW + RESOLUTION_HEIGH, self, false, false))
	audio_play_sound_on(global.SFX_Emitter, snd_explosion, false, false);