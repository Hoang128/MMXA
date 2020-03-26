/// @description 
if ((instance_exists(obj_playerX)))
{
	if (obj_playerX.aState == ActionState.SLIDING)
	{
		self.x = obj_playerX.x + self.xPlace * image_xscale;
		self.y = obj_playerX.y + self.yPlace;
	}
	else instance_destroy();
}