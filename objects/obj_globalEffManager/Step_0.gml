/// @description Step
if (timeSlowEff == true)
{
	if (timeSlowCounter > 0)
	{
		timeSlowCounter -= DELTA_TIME;
	}
	else 
	{
		global.deltaTime = 1;
		timeSlowEff = false;
	}
}