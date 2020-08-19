function scr_playerVoiceLowHp(argument0) {
	var player = argument0;

	switch (player)
	{
		case obj_playerX:
		case obj_playerXUA:
		{
			var rand = random(3);
			if (rand > 2)
				audio_play_sound_on(global.SFX_Emitter, snd_VXLowHp1, 0, 0);
			else if (rand > 1)
				audio_play_sound_on(global.SFX_Emitter, snd_VXLowHp2, 0, 0);
			else
				audio_play_sound_on(global.SFX_Emitter, snd_VXLowHp3, 0, 0);
		}	break;
		case obj_playerZ:
		{
			audio_play_sound_on(global.SFX_Emitter, snd_VZLowHp, 0, 0);
		}	break;
	}


}
