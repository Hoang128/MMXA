/// @description Move

if (startMove == false)
{
	motion_set(direction, moveSpd * DELTA_TIME);
	startMove = true;
}