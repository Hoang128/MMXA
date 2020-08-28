/// @description Insert description here
// You can write your code in this editor
/// @description Handle

var xx = X_VIEW;
var yy = Y_VIEW;
var ww = W_VIEW;
var hh = H_VIEW;

if (collision_rectangle(xx, yy, xx + ww, yy + hh, self,false, false))
{
	if (createTime < createTimeMax)
	{
		createTime += global.deltaTime;
	}
	
	else
	{
		var obj = instance_create_depth(x, y, depth, childObjectType);
		obj.parent = self;
		obj.image_xscale = image_xscale;
		obj.image_yscale = image_yscale;
		obj.startDir = image_angle;
		if (childObjectPal != noone)
		{
			obj.palette = childObjectPal;
			obj.paletteNumber = childObjectPalNumber;
			with (obj)
				scr_PalSwapInitSystem(shd_pal_swapper);
		}
		createTime = 0;
	}
}
else
{
	if (createTime < (createTimeMax/2))
		createTime = createTimeMax/2;
}