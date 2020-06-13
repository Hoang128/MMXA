/// @description Init for stage or menu

//Debug
if (global.debugging)
{
	instance_create_depth(x, y, 0, obj_Debug);
}

//Init for start room

instance_create_depth(x, y, depth, obj_effOpening_Black);

if (global.isStage)
{
	instance_create_depth(x, y, -1500, obj_playerHUD);
	instance_create_depth(x, y, -1500, obj_fMenuMapName);
	instance_create_depth(x, y, depth, obj_globalEffManager);
	instance_create_depth(global.xSpawmLocation, global.ySpawmLocation, depth, obj_view);
	var player = instance_create_depth(global.xSpawmLocation, global.ySpawmLocation, -100, obj_playerZ);
	if (global.xSpawmLocation < 64)	
	{
		player.hDir = 1;
		player.image_xscale = 1;
	}
	if (global.xSpawmLocation > room_width - 64)	
	{
		player.hDir = -1;
		player.image_xscale = -1;
	}
}

roomTrans = -1;
timeWaitTrans = timeWaitTransMax;