function scr_XAtk7TimeCharge() {
	if (keyboard_check_released(global.keySpAtk))
	{
		if (chargeWeapon >= chargeLv2Limit)
		{
			if (!instance_exists(obj_XW7chronoForce))
			{
				scr_playerXImpactAttack(60, obj_XW7ChronoForceCharge);
			}
		}
		chargeWeapon = 0;
	}


}
