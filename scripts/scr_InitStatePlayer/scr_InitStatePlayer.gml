function scr_InitStatePlayer(argument0) {
	var weightPlayer = argument0;

	switch weightPlayer
	{
		case WeighType.MASSIVE: break;
		default:
		{
			//Default state
		
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
					case obj_playerXUA:
					case obj_playerEclipseX:
					{
						audio_play_sound_on(global.SFX_Emitter, snd_XBeamDownEff, 0, 0);	
					}	break;
					case obj_playerZ:
					{
						audio_play_sound_on(global.SFX_Emitter, snd_ZBeamDownEff, 0, 0);	
					}	break;
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
