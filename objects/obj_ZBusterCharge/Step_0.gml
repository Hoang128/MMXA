/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (init == false)
{
	var meetWall = collision_rectangle(bbox_left, (bbox_top + (bbox_bottom + bbox_top) / 2) / 2, bbox_right, (bbox_bottom + (bbox_top + bbox_bottom) / 2) / 2, obj_block, false, false);
	if (meetWall)
	{
		var xPlace = 0;
		if (image_xscale == 1)
			xPlace = meetWall.bbox_left;
		else
			xPlace = meetWall.bbox_right;
		var colWallObj = instance_create_depth(xPlace , y, depth - 1, collisionEff);
		colWallObj.image_xscale = image_xscale;
		colWallObj.from = self.object_index;
		instance_destroy();
	}
	init = true;
}
else
{
	hspd = moveSpd * image_xscale;
	vspd = vMoveSpd;

	if (flyTime > 0)
	{
		x += hspd * DELTA_TIME;
		y += vspd * DELTA_TIME;
		if (barrage == 0)
		{
			var meetWallLeft = collision_rectangle(bbox_left, (bbox_top + (bbox_bottom + bbox_top) / 2) / 2, bbox_left - 1, (bbox_bottom + (bbox_top + bbox_bottom) / 2) / 2, obj_block, false , true);
			var meetWallRight = collision_rectangle(bbox_right, (bbox_top + (bbox_bottom + bbox_top) / 2) / 2, bbox_right + 1, (bbox_bottom + (bbox_top + bbox_bottom) / 2) / 2, obj_block, false , true);
			if (image_xscale == 1 && meetWallRight) || (image_xscale == -1 && meetWallLeft)
			{
				var xPlace = 0;
				if (image_xscale == 1)
					xPlace = meetWallRight.bbox_left;
				if (image_xscale == -1)
					xPlace = meetWallLeft.bbox_right;
				var colWallObj = instance_create_depth(xPlace , y, depth - 1, collisionEff);
				colWallObj.image_xscale = image_xscale;
				colWallObj.from = self.object_index;
				colWallObj.myPalette = spr_PalBusterColEff;
				instance_destroy();
			}
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
}