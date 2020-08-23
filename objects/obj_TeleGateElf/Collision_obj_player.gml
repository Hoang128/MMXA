/// @description Insert description here
// You can write your code in this editor
if (phase == 0)
{
	if (instance_exists(obj_gameManager.playerCore))
	{
		var objEff1 = instance_create_depth(other.x, other.y, depth - 1, obj_TeleGateEff);
		objEff1.direction = 0;
		objEff1.blinkTime = 5;
		objEff1.sprite_index = obj_gameManager.playerCore.sprite_index;
		objEff1.image_index = obj_gameManager.playerCore.image_index;
		objEff1.image_xscale = obj_gameManager.playerCore.image_xscale;
		var objEff2 = instance_create_depth(other.x, other.y, depth - 1, obj_TeleGateEff);
		objEff2.direction = 180;
		objEff2.sprite_index = obj_gameManager.playerCore.sprite_index;
		objEff2.image_index = obj_gameManager.playerCore.image_index;
		objEff2.image_xscale = obj_gameManager.playerCore.image_xscale;
		
		switch (obj_gameManager.playerCore.object_index)
		{
			case obj_playerZ:
				audio_play_sound_on(global.SFX_Emitter,  snd_ZJumpEff, 0, 0);	break;
			case obj_playerX:
			case obj_playerEclipseX:
			case obj_playerXUA:
				audio_play_sound_on(global.SFX_Emitter,  snd_XJumpEff, 0, 0);	break;
		}
	
		instance_destroy(obj_gameManager.playerCore);
	}
	phase = 1;
}