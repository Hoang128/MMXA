/// @description 
if ((instance_exists(core)))
{
	if (core.aState == ActionState.SLIDING)
	{
		self.x = core.x + self.xPlace * image_xscale;
		self.y = core.y + self.yPlace;
	}
	else instance_destroy();
}