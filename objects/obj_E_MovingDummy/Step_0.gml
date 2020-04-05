/// @description Handle

event_inherited();

if (timmer > 0)
{
	timmer -= myDeltaTime*global.deltaTime;
}
else
{
	if (change == 0)
	{
		timmer = 120;
		if (move == 1)
			change = 1;
		if (move == -1)
			change = -1;
	}
}

if (change == 1)
{
	if (move == 1) 
	{
		move = -1;
		change = 0;
	}
}

if (change == -1)
{
	if (move == -1)
	{
		move = 1;
		change = 0;
	}
}

hspd = move * moveSpd * myDeltaTime * global.deltaTime;

x += hspd;