/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hspd = moveSpd * image_xscale;

if (flyTime > 0)
{
	x += hspd * DELTA_TIME;
	if place_meeting(x, y, obj_block) 
	{
		var xPlace = x + image_xscale * (bbox_right - bbox_left) / 2;
		var colWallObj = instance_create_depth(xPlace , y, depth - 1, collisionEff);
		colWallObj.image_xscale = image_xscale;
		colWallObj.from = self.object_index;
		colWallObj.myPalette = spr_PalBusterColEff;
		instance_destroy();
	}
	flyTime -= DELTA_TIME;
	
	if (timmer > 0) timmer -= DELTA_TIME;
	else
	{
		randomize();
		var xPlace = self.x;
		var yPlace = self.bbox_top + floor(random(effWidthNumber)) * effWidthRange;
		var obj = instance_create_depth(xPlace, yPlace, depth, obj_ZBusterChargeEff);
		obj.image_xscale = image_xscale;
		obj.hspd = hspd / 2;
		
		timmer = maxTimmer;
	}
}
else
{
	createEff = true;
	instance_destroy();
}