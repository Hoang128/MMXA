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
		
		var objSaber = instance_create_depth(x, y, depth, obj_ZSaber);
		objSaber.state = weaponState;
		objSaber.core = core;
	}
	break;
}