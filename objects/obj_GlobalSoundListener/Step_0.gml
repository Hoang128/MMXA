/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_XW6TornadoEff))
{
	if (!audio_is_playing(snd_XSkill6TornadoEff))
		audio_play_sound_on(global.SFX_Emitter, snd_XSkill6TornadoEff, false, false);
}
else
{
	if (audio_is_playing(snd_XSkill6TornadoEff))
		audio_stop_sound(snd_XSkill6TornadoEff);
}