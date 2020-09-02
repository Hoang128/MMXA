/// @description Insert description here
// You can write your code in this editor
if (instance_exists(core))
{
	if (init == false)
	{
		xPlace = core.xPlace;
		yPlace = core.yPlace;
		init = true;
	}
	visible = core.visible;
}
else	instance_destroy();