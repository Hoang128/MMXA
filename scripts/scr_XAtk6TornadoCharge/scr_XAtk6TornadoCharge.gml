function scr_XAtk6TornadoCharge(manaCost) {
	if (keyboard_check_released(global.keySpAtk))
	{
		if (global.wp[6] >= manaCost)
		{
			if (chargeWeapon >= chargeLv2Limit)
			{
				scr_playerXImpactAttack(180, obj_XW6TornadoCharge, 6, manaCost);
			}
			chargeWeapon = 0;
		}
	}


}
