function scr_ConsumeWeaponCapsule(wpConsume, capsule) {
	switch (global.currentPlayer)
	{
		case 0:
		{
			if (global.wp[currentWeapon] + wpConsume > global.wpMax[0])
			{
				global.wp[currentWeapon] = global.wpMax[0];
				instance_destroy(capsule);
				return;
			}
			else
			{
				global.wp[currentWeapon] += wpConsume;
				instance_destroy(capsule);
				return;
			}
		}	break;
		case 1:
		{
			if (global.zp + wpConsume > global.wpMax[1])
			{
				global.zp = global.wpMax[1];
				instance_destroy(capsule);
				return;
			}
			else
			{
				global.zp += wpConsume;
				instance_destroy(capsule);
				return;
			}
		}	break;
	}
}
