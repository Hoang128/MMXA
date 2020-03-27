/// @description

if (instance_exists(core))
{
	self.x = core.x + self.xPlace * image_xscale;
	self.y = core.y + self.yPlace;
}