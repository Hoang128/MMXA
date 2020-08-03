/// @description Init
playerCore = noone;
instance_create_depth(x, y, depth + 200, obj_globalEffManager);

if (!global.isStage)
{
	view_enabled = false;
	view_visible = false;
	instance_destroy();
}
view_enabled = true;
view_visible = true;

scr_InitCamera();
//Create UI support

enum CameraState
{
	CUTSCENE,
	NORMAL,
	LOCK_REGION,
	FAILURE
};

moveMode = CameraState.NORMAL;
moveSpd = 8;

state = CameraState.NORMAL;

quake = 0;

xPos = 0;
yPos = 0;