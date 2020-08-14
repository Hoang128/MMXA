/// @description Insert description here
// You can write your code in this editor
if (!init)
{
	dir = image_xscale;
	direction = 90 - image_xscale * 90 + firstDir;
	motion_set(direction, spd);
	init = true;
}
else
{
	scr_destroyObjOutOfCamera(self);
	
	//Image direction
	if image_xscale == 1
	   image_angle = direction;
	else
	{
	   image_xscale = 1;
	   image_yscale = -1;
	   image_angle = - direction;
	}
	
	//Create effect
	if (createWindTime < createWindMax)
		createWindTime += DELTA_TIME;
	else
	{
		var objWind = instance_create_depth(x, y, depth + 1, obj_XW6TornadoEff);
		objWind.image_xscale = image_xscale;
		objWind.image_yscale = image_yscale;
		objWind.image_angle = image_angle;
		createWindTime = 0;
	}
	
	createWindMax = ceil(constBalance / spd);
	
	//Phase non target
	if (phase == 1)
	{
		if (nonTargetTime < nonTargetTimeMax)
		{
			nonTargetTime += DELTA_TIME;
		}
		else
		{
			phase = 2;
		}
	}
	
	//Phase have target
	if (phase == 2)
	{
		if ((direction >= 90 && direction < 270))	dir = -1;
		else dir = 1;
		if (!instance_exists(target) || (target == -1))
		{
			targetList = ds_list_create();
			with (obj_E_RealEnemy)
			{
				if (collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false ,false))
				{
					if (sign((self.bbox_right+self.bbox_left)/2-other.x) == sign(other.dir))
						ds_list_add(other.targetList, id);
				}
			}
			if (ds_list_size(targetList) > 0)
			{
				var minTarget = ds_list_find_value(targetList,0);
				var minDistance = distance_to_point((minTarget.bbox_left+minTarget.bbox_right)/2,(minTarget.bbox_top+minTarget.bbox_bottom)/2);
				for (var i = 1; i<ds_list_size(targetList) - 1; i++)
				{
					var currentTarget = ds_list_find_value(targetList,i);
				    var currentDistance = distance_to_point((currentTarget.bbox_left+currentTarget.bbox_right)/2,(currentTarget.bbox_top+currentTarget.bbox_bottom)/2);
				    if minDistance > currentDistance 
					{
						minTarget = currentTarget;
				        minDistance = currentDistance;
				    }
				}
				target = minTarget;
			}
			else	target = -1;
			ds_list_clear(targetList);
		}
		
		if (instance_exists(target) && (target != -1))
		{
			var a = point_direction(x, y, (target.bbox_left + target.bbox_right)/2, (target.bbox_top + target.bbox_bottom)/2);
			direction += sign(dsin(a - direction)) * 10;
		}
	}
	spd += DELTA_TIME;
	motion_add(direction, spd / 300 * DELTA_TIME);
}