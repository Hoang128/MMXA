function scr_MeeleWeaponCreate(obj_ImageWeapon, weaponState, core) 
{
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
		
		case obj_ZThunderDiveImage:
		{
			var objSaberImage = instance_create_depth(x, y, depth - 1, obj_ZThunderDiveImage);
			objSaberImage.core = core;
		
			var objSaber = instance_create_depth(x, y, depth - 2, obj_ZThunderSaber);
			objSaber.core = core;
		}	break;
		
		case obj_ZDarkThurstSaberImage:
		{
			var objSaberImage = instance_create_depth(x, y, depth - 1, obj_ZDarkThurstSaberImage);
			objSaberImage.core = core;
		
			var objSaber = instance_create_depth(x, y, depth - 2, obj_ZDarkThurstSaberHitbox);
			objSaber.core = core;
		}	break;
		
		default:
		{
			show_message("ERROR! Can't create instance that isn't meele weapon!");
		}
	}


}
