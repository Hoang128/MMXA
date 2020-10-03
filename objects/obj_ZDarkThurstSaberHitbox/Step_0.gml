/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if ((image_index > 1) && (image_index < 10))
{
	if (createDustWait >= 0)
	{
		createDustWait -= DELTA_TIME;
	}
	else
	{
		var count = floor(random(dustNumberCount));
		var xPlace = 0;
		var yPlace = 0;
		if (image_index < 3)
		{
			xPlace = x + xoff1 * image_xscale;
			yPlace = y + yoff1 - width;
		}
		else
		{
			xPlace = x + xoff2 * image_xscale;
			yPlace = y + yoff2 - width;
		}
		
		yPlace += width * 2 / dustNumberCount * count;
		
		var dust = instance_create_depth(xPlace, yPlace, depth - 1, obj_ZDarkDust);
		dust.image_xscale = self.image_xscale;
		createDustWait = createDustWaitMax;
	}
}