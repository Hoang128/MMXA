function scr_InitStatePlayer(argument0) {
	var weightPlayer = argument0;

	switch weightPlayer
	{
		case WeighType.MASSIVE: break;
		default:
		{
			//Default state
			var objHUD = instance_create_depth(x, y, layer_get_depth(obj_gameManager.lHUD), obj_playerHUD);
			objHUD.core = self;
		
			vspd = beamSpd;
			activateState = ActivateState.DEACTIVATE;
			if (global.airSpawm == true)
			{
				aState = ActionState.BEAMDOWN;
				sprite_index = sprFlash;
				image_index = 0;
				switch(object_index)
				{
					case obj_playerX:
						//Sound Beam-down
						audio_play_sound_on(global.SFX_Emitter, snd_XBeamDownEff, 0, 0);	break;
					case obj_playerZ:
						//Sound Beam-down
						audio_play_sound_on(global.SFX_Emitter, snd_ZBeamDownEff, 0, 0);	break;
				}
				vState = VerticalState.V_MOVE_DOWN;
			}
			else
			{
				activateState = ActivateState.HALF_ACTIVATE;
				aState = ActionState.STARTDOWN;
				vState = VerticalState.V_ON_GROUND;
				sprite_index = sprStand;
				image_index = 5;
			}
			hState = HorizontalState.H_MOVE_NONE;
			atkState = AttackState.A_NONE;
		}
		break;
	}


}
