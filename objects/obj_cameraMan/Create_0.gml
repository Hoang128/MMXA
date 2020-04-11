/// @description Init

enum CameraState
{
	CUTSCENE,
	NORMAL,
	LOCK_REGION,
	LOCK_VERTICAL,
	LOCK_HORIZONTAL,
	FAILURE
};

state = CameraState.NORMAL;
playerCore = noone;