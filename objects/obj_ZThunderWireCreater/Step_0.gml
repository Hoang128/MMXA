/// @description Insert description here
// You can write your code in this editor
if (thunderNumber < thunderNumberMax)
{
	if (timeWait >= timeWaitMax)
	{
		var obj1 = instance_create_depth(x + 16 * image_xscale, y - 3, depth + 2, obj_ZThunderWire);
		obj1.dir = 1;
		var obj2 = instance_create_depth(x + 16 * image_xscale, y - 3, depth + 2, obj_ZThunderWire);
		obj2.dir = -1;
		
		if (thunderNumber == floor((thunderNumberMax - 1) / 2))
		{
			var obj3 = instance_create_depth(x + 16 * image_xscale, y - 14, depth + 1, obj_ZThunderOrb);
			obj3.direction = 180;
			var obj4 = instance_create_depth(x + 16 * image_xscale, y - 14, depth + 1, obj_ZThunderOrb);
			obj4.direction = 0;
		}
		canCreateThunderDiveWire = false;
		thunderNumber++;
		timeWait = 0;
	}
	else
		timeWait += DELTA_TIME;
}
else
	instance_destroy();