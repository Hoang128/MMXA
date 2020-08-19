function scr_XAtk6TornadoCharge() {
	if (keyboard_check_released(global.keySpAtk))
	{
		if (chargeWeapon >= chargeLv2Limit)
		{
			scr_playerXImpactAttack(180, obj_XW6TornadoCharge);
		}
		chargeWeapon = 0;
	}


}
