/// @description Init

if (init == false)
{
	obj_view.state = CameraState.FAILURE;
	
	with (playerChangeFrom)
	{
		instance_destroy();
	}
		
	var objPlayer = instance_create_depth(playerChangeFrom.x, camera_get_view_y(view_camera) - 64, playerChangeFrom.depth++, playerChangeTo);
	objPlayer.yBeam = self.y;
	init = true;
}

else instance_destroy();