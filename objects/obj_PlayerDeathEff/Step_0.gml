/// @description Move

if (startMove == false)
{
	speed = moveSpd * 2 * DELTA_TIME
	motion_set(direction, speed);
	startMove = true;
}

else
{
	if (speed > 1)
	{
		speed -= slowSpd * DELTA_TIME;
		motion_set(direction, speed);
	}
}