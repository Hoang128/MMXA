function scr_XAtk8Dark() {
	if (keyboard_check_pressed(global.keySpAtk))
	{
		if (!instance_exists(obj_XW8DarkSphere))
		{
			var obj1 = instance_create_depth(x, y, layer_get_depth(obj_gameManager.lBullet), obj_XW8DarkSphere);
			obj1.angle = 0;
			obj1.core = self;
			var obj2 = instance_create_depth(x, y, layer_get_depth(obj_gameManager.lBullet), obj_XW8DarkSphere);
			obj2.angle = 120;
			obj2.core = self;
			var obj3 = instance_create_depth(x, y, layer_get_depth(obj_gameManager.lBullet), obj_XW8DarkSphere);
			obj3.angle = 240;
			obj3.core = self;
		}
	}


}
