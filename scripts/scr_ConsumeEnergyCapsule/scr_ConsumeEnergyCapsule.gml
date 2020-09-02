function scr_ConsumeEnergyCapsule(hpConsume, character, capsule) {
	var charNumber = 0;
	switch (character)
	{
		case obj_playerX:	charNumber = 0;	break;
		case obj_playerZ:	charNumber = 1;	break;
	}

	if (global.hp[charNumber] + hpConsume > global.hpMax[charNumber])
	{
		global.hp[charNumber] = global.hpMax[charNumber];
		instance_destroy(capsule);
		return;
	}
	else
	{
		global.hp[charNumber] += hpConsume;
		instance_destroy(capsule);
		return;
	}


}
