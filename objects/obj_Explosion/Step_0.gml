/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!init)
{
	if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false) && (makeSound == true))
	audio_play_sound_on(global.SFX_Emitter, snd_explosion, false, false);
	init = true;
}