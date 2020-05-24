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
	
	case obj_PlayerWeaponMeeleImage:
	{
		if (instance_exists(obj_PlayerWeaponMeeleImage))
			instance_destroy(obj_PlayerWeaponMeeleImage);
		
		if (instance_exists(obj_PlayerWeaponMeele))
			instance_destroy(obj_PlayerWeaponMeele);
	}
	break;
}