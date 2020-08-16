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
	
	case obj_ZIceSaberImage:
	{
		var objSaberImage = instance_create_depth(x, y, depth - 1, obj_ZIceSaberImage);
		objSaberImage.core = core;
		
		var objSaber = instance_create_depth(x, y, depth - 2, obj_ZIceSaber);
		objSaber.core = core;
	}	break;
	
	case obj_ZFlameSaberImage:
	{
		var objSaberImage = instance_create_depth(x, y, depth - 1, obj_ZFlameSaberImage);
		objSaberImage.core = core;
		
		var objSaber = instance_create_depth(x, y, depth - 2, obj_ZFlameSaber);
		objSaber.core = core;
	}	break;
}