function scr_ConsumeWeaponCapsule(argument0, argument1, argument2) {
	var wpConsume = argument0;
	var character = argument1;
	var capsule = argument2;
	var charNumber = 0;
	switch (character)
	{
		case obj_playerX:	charNumber = 0;	break;
		case obj_playerZ:	charNumber = 1;	break;
	}

	if (wp + wpConsume > global.wpMax[charNumber])
	{
		wp = global.wpMax[charNumber];
		instance_destroy(capsule);
		return;
	}
	else
	{
		wp += wpConsume;
		instance_destroy(capsule);
		return;
	}


}
