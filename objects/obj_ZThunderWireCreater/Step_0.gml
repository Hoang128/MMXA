/// @description Insert description here
// You can write your code in this editor
if (thunderNumber > 0)
{
	if (timeWait >= timeWaitMax)
	{
		var obj1 = instance_create_depth(x + 16 * image_xscale, y - 3, depth + 1, obj_ZThunderWire);
		obj1.dir = 1;
		var obj2 = instance_create_depth(x + 16 * image_xscale, y - 3, depth + 1, obj_ZThunderWire);
		obj2.dir = -1;
		canCreateThunderDiveWire = false;
		thunderNumber--;
		timeWait = 0;
	}
	else
		timeWait += DELTA_TIME;
}
else
	instance_destroy();