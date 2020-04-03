/// @description

if (instance_exists(core) && (core.sprite_index == core.sprDash1 || core.sprite_index == core.sprDash2))
{
	
	self.x = core.x + self.xPlace * image_xscale;
	self.y = core.y + self.yPlace;
}
else instance_destroy();