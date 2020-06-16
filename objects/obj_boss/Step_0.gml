/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (init == false)
{
	if (obj_bossManager.phase == 3)
	{
		if (hp < hpMax)
		{
			if (!instance_exists(obj_bossHUD))
			{
				instance_create_layer(x, y, obj_gameManager.lHUD, obj_bossHUD);
			}
			if (sprite_index != sprGainHp)
			{
				sprite_index = sprGainHp;
				image_index = 0;
			}
			if (!audio_is_paused(snd_gainHp))
				audio_play_sound_on(global.SFX_Emitter, snd_gainHp, false, false);
			hp+=gainHpSpd;
		}
		else
		{
			hp = hpMax;
			obj_bossManager.phase = 3.5;
			state = 0;
			scr_BGMSet(bgm_X5VSBoss, false);
			init = true;
		}
	}
}
else
{
	event_inherited();

	if (hp <= 0)	
	{
		scr_BGMStop();
		instance_destroy();
	}

	if (inviTime > 0)
	{
		if (blink > 0) blink -= DELTA_TIME;
		else blink = blinkMax;
		blinkTime -= DELTA_TIME;
	}
	else
	{
		blink = 0;
		blinkTime = 0;
	}
}