function scr_MeeleWeaponDestroy(argument0) {
	var obj_ImageWeapon = argument0;

	switch (obj_ImageWeapon)
	{
		case obj_ZSaberImage:
		{
			if (instance_exists(obj_ZSaberImage))
				instance_destroy(obj_ZSaberImage);
		
			if (instance_exists(obj_ZSaber))
				instance_destroy(obj_ZSaber);
		}
		break;
	
		case obj_ZIceSaberImage:
		{
			if (instance_exists(obj_ZIceSaberImage))
				instance_destroy(obj_ZIceSaberImage);
		
			if (instance_exists(obj_ZIceSaber))
				instance_destroy(obj_ZIceSaber);
		}
		break;
	
		case obj_ZFlameSaberImage:
		{
			if (instance_exists(obj_ZFlameSaberImage))
				instance_destroy(obj_ZFlameSaberImage);
		
			if (instance_exists(obj_ZFlameSaber))
				instance_destroy(obj_ZFlameSaber);
		}
		break;
	
		case obj_PlayerWeaponMeeleImage:
		{
			if (instance_exists(obj_PlayerWeaponMeeleImage))
				instance_destroy(obj_PlayerWeaponMeeleImage);
		
			if (instance_exists(obj_PlayerWeaponMeele))
				instance_destroy(obj_PlayerWeaponMeele);
		}
		break;
	}


}
