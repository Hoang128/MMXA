/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (backExecute) instance_destroy();

if (lineExecute[1])
{
	if (!instance_exists(lineChild[1]))
	{
		var obj = instance_create_depth(x + width + 16, y, depth, lineChild[1]);
		obj.width = (1280 - obj.x - 16);
		obj.height = self. height;
	}
}

if (lineExecute[3])
{
	if (!instance_exists(lineChild[3]))
	{
		var obj = instance_create_depth(x + width + 16, y, depth, lineChild[3]);
		obj.width = (1280 - obj.x - 16);
		obj.height = self. height;
	}
}

if (lineExecute[4])
{
	if (!instance_exists(lineChild[4]))
	{
		var obj = instance_create_depth(x + width + 16, y, depth, lineChild[4]);
		obj.width = (1280 - obj.x - 16);
		obj.height = self. height;
	}
}

if (lineExecute[5])
{
	instance_destroy();
}