/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case spr_ZThunderBlasterStart:
	{
		sprite_index = spr_ZThunderBlasterDamage;
		image_index = 0;
		audio_play_sound_on(global.SFX_Emitter, snd_XSkill7Shot, false, false);
		break;
	}
	case spr_ZThunderBlasterDamage:
	{
		if (loopTime < loopTimeMax)
		{
			loopTime ++;
			image_index = 0;
			audio_play_sound_on(global.SFX_Emitter, snd_XSkill7Shot, false, false);
		}
		else
			instance_destroy();
		break;
	}
}