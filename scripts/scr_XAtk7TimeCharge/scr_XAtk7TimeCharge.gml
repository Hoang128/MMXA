function scr_XAtk7TimeCharge(manaCost) {
	if (keyboard_check_released(global.keySpAtk))
	{
		if (global.wp[7] >= manaCost)
		{
			if (chargeWeapon >= chargeLv2Limit)
			{
				if (!instance_exists(obj_XW7chronoForce))
				{
					scr_playerXImpactAttack(60, obj_XW7ChronoForceCharge, 7, manaCost);
				}
			}
			chargeWeapon = 0;
		}
	}
}
