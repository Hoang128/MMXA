/// @description Handle

if (!instance_exists(obj_menuSounds)) instance_destroy();
if (active)
{
	if (keyboard_check_pressed(global.keyLeft))
	{
		if (valDisplay > minVal)
		{
			valDisplay--;
		}
	}
	
	if (keyboard_check_pressed(global.keyRight))
	{
		if (valDisplay < maxVal)
		{
			valDisplay++;
		}
	}
	
	if (keyboard_check_pressed(global.keyDash))
	{
		active = -3;
		obj_menuSounds.lineExecute[line] = false;
		obj_menuSounds.lineHandle[line] = false;
		obj_menuSounds.active = 1;
	}
	
	if (keyboard_check_pressed(global.keyJump))
	{
		active = -3
		parameter = valDisplay / ratio;
		obj_menuSounds.lineExecute[line] = false;
		obj_menuSounds.lineHandle[line] = false;
		obj_menuSounds.active = 1;
	}
}
else 
{
	if (active >= -2) active++;
}