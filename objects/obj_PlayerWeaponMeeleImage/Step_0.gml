/// @description Handle event and follow the core

if (core != noone)
{
	if (instance_exists(core) && (core.atkState != AttackState.A_NONE))
	{
		self.x = core.x;
		self.y = core.y;
		self.image_index = core.image_index;
		self.image_xscale = core.image_xscale;
	}
	else instance_destroy();
}
else instance_destroy();