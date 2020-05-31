/// @description Init

enum CameraState
{
	CUTSCENE,
	NORMAL,
	LOCK_REGION,
	FAILURE
};

state = CameraState.NORMAL;
playerCore = noone;

moveMode = 1;
moveSpd = 8;