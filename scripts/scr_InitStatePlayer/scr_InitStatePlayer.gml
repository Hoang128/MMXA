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
			move_contact_solid(270, 0);
		}
		hState = HorizontalState.H_MOVE_NONE;
		atkState = AttackState.A_NONE;
		
		
		image_index = 0;
	}
	break;
}