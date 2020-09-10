/// @description Handle

var xx = X_VIEW - W_VIEW / 2;
var yy = Y_VIEW - H_VIEW / 2;
var ww = W_VIEW * 2;
var hh = H_VIEW * 2;

if (collision_rectangle(X_ACTIVE_BOX, Y_ACTIVE_BOX, X_ACTIVE_BOX + W_ACTIVE_BOX, Y_ACTIVE_BOX + H_ACTIVE_BOX, self, false, false))
{
	if (!collision_rectangle(xx, yy, xx + ww, yy + hh, self,false, false))
	{
		if (child == noone)
		{
			if (childObjectType != noone)
			{
				var obj = instance_create_depth(x, y, depth, childObjectType);
				obj.parent = self;
				obj.image_xscale = image_xscale;
				obj.image_yscale = image_yscale;
				obj.image_angle = image_angle;
				obj.moveSpaceMax = moveSpaceMax;
				obj.moveDir = moveDir;
				if (childObjectPal != noone)
				{
					obj.palette = childObjectPal;
					obj.paletteNumber = childObjectPalNumber;
					with (obj)
						scr_PalSwapInitSystem(shd_pal_swapper);
				}
				child = obj;
			}
		}
	}
}