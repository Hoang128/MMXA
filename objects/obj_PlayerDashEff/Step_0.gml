/// @description
if (init == false)
{
	switch (core.object_index)
	{
		case obj_playerX:
		case obj_playerXUA:
		case obj_playerEclipseX: 
			sprite_index = spr_XDashEff;	break;
		case obj_playerZ:	
			sprite_index = spr_ZDashEff;	break;
	}
}
else
{
	if (instance_exists(core) && (core.sprite_index == core.sprDash1 || core.sprite_index == core.sprDash2))
	{
		myDeltaTime = core.myDeltaTime;
		self.x = core.x + self.xPlace * image_xscale;
		self.y = core.y + self.yPlace;
	}
	else instance_destroy();
}