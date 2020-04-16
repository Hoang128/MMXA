/// @description Follow core
if (core != noone)
if (instance_exists(core))
{
	x = (core.bbox_right + core.bbox_left) / 2;
	y = (core.bbox_top + core.bbox_bottom) / 2;
	image_xscale = core.image_xscale;
	
	if (init == false)
	{
		sfx = audio_play_sound_on(global.SFX_Emitter, snd_ChargeEff, 0, 0);
		init = true;
	}
	else
	{
		var pos = audio_sound_get_track_position(sfx);
	    if (pos > bgmLength) audio_sound_set_track_position(sfx, pos-loop);
	}
}
else instance_destroy();

