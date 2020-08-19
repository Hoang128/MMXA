function scr_BGMStop() {
	with (obj_BGMManager)
	{
		if (audio_is_playing(currentBGM))
			audio_stop_sound(currentBGM);
	}


}
