function scr_MeeleWeaponChangeState(argument0, argument1) {
	var obj_ImageWeapon = argument0;
	var state = argument1;

	switch (obj_ImageWeapon)
	{
		case obj_ZSaberImage:
		{
			if (instance_exists(obj_ZSaberImage))
			{
				obj_ZSaberImage.state = state;
				obj_ZSaberImage.setupState = true;
		
				obj_ZSaber.state = state;
				obj_ZSaber.setupState = true;
				obj_ZSaber.hit = 0;
			}
		}	break;
	}


}
