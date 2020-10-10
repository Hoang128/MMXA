/// @description Init for stage or menu

//Debug
if (global.debugging)
{
	instance_create_depth(x, y, 0, obj_Debug);
}

//Init for start room
instance_create_depth(x, y, depth, obj_effOpening_Black);
//instance_create_depth(x, y, depth, obj_controller);

//Layer create
lPlayer = layer_create(0);
lBullet = layer_create(40);
lEnemy  = layer_create(50);
lHUD    = layer_create(-5000);
lUI		= layer_create(-6000);

//Init Object
if (global.isStage)
{
	instance_create_depth(x, y, lHUD, obj_fMenuMapName);
	instance_create_depth(x, y, -1000, obj_globalEffManager);
	instance_create_depth(global.xSpawmLocation, global.ySpawmLocation, depth, obj_view);
	switch(global.currentPlayer)
	{
		case 0:
			var player = instance_create_layer(global.xSpawmLocation, global.ySpawmLocation, lPlayer, obj_playerEclipseX);	
				break;
		case 1:
			var player = instance_create_layer(global.xSpawmLocation, global.ySpawmLocation, lPlayer, obj_playerZ);	
				break;
	}
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