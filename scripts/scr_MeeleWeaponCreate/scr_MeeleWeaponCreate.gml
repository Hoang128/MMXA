var obj_ImageWeapon = argument0;
var weaponState = argument1;
var core = argument2;

switch (obj_ImageWeapon)
{
	case obj_ZSaberImage:
	{
		var objSaberImage = instance_create_depth(x, y, depth - 1, obj_ZSaberImage);
		objSaberImage.state = weaponState;
		objSaberImage.core = core;
		
		var objSaber = instance_create_depth(x, y, depth - 2, obj_ZSaber);
		objSaber.state = weaponState;
		objSaber.core = core;
	}	break;
	
	case obj_IceSaberImage:
	{
		var objSaberImage = instance_create_depth(x, y, depth - 1, obj_IceSaberImage);
		objSaberImage.core = core;
		
		var objSaber = instance_create_depth(x, y, depth - 2, obj_IceSaber);
		objSaber.core = core;
	}	break;
	
	case obj_FlameSaberImage:
	{
		var objSaberImage = instance_create_depth(x, y, depth - 1, obj_FlameSaberImage);
		objSaberImage.core = core;
		
		var objSaber = instance_create_depth(x, y, depth - 2, obj_FlameSaber);
		objSaber.core = core;
	}	break;
}