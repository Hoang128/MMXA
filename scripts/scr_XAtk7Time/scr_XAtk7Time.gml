function scr_XAtk7Time() {
	if (keyboard_check_pressed(global.keySpAtk))
	{
		if (!instance_exists(obj_XW7chronoForce))
		{
			instance_create_depth((bbox_right + bbox_left)/2, (bbox_top + bbox_bottom)/2, depth - 1, obj_XW7chronoForce);
		}
	}


}
