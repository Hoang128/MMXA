/// @description Init for stage or menu

//Debug
if (global.debugging)
{
	instance_create_depth(x, y, 0, obj_Debug);
}

//Init for start room

if (global.isStage)
{
	instance_create_depth(x, y, -100, obj_playerZ);
	instance_create_depth(x, y, depth, obj_view);
}