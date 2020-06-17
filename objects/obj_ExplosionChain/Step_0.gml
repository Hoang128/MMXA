/// @description
if (chainNumber < chainMax)
{
	if (chainTime < chainTimeMax)
	{
		chainTime += DELTA_TIME;
	}
	else
	{
		var explosion = instance_create_depth(x - rangeMax + random(rangeMax * 2), y - rangeMax + random(rangeMax * 2), depth, obj_Explosion);
		explosion.makeSound = self.makeSound;
		chainTime = 0;
		chainNumber++;
	}
}
else	instance_destroy();