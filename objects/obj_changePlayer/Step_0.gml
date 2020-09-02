/// @description Init

if (init == false)
{
	obj_view.state = CameraState.FAILURE;
	
	with (playerChangeFrom)
	{
		depth++;
		sprite_index = sprBeamUp;
		image_index = 0;
		audio_play_sound_on(global.SFX_Emitter, sndBeamUp, 0, 0);
		instance_destroy(obj_playerHUD);
		aState = ActionState.BEAMUP;
		activateState = ActivateState.HALF_ACTIVATE;
	}
		
	var objPlayer = instance_create_depth(playerChangeFrom.x, camera_get_view_y(view_camera) - 64, playerChangeFrom.depth++, playerChangeTo);
	objPlayer.yBeam = self.y;
	init = true;
}

else instance_destroy();