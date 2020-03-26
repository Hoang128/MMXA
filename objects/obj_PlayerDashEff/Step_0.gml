/// @description

if (instance_exists(obj_playerX))
{
	self.x = obj_playerX.x + self.xPlace * image_xscale;
	self.y = obj_playerX.y + self.yPlace;
}