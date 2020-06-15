/// @description Insert description here
// You can write your code in this editor

if (!audio_is_playing(snd_warningEff))
	audio_play_sound_on(global.SFX_Emitter, snd_warningEff, 0, 0);
if (loop < loopTime)
{
	if (image_index > 71)
	{
		image_index = 58;
		loop++;
	}
}