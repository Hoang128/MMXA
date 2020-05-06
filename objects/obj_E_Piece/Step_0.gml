/// @description 
event_inherited();

scr_destroyObjOutOfCamera(self);

if (cycleEff > cycleEffMax)
{
	cycleEff = 0;
}
else
{
	if (cycleEff < cycleEffMax / 2)	image_alpha = 0.8;
	else image_alpha = 0;
	cycleEff += DELTA_TIME;
}

if (vspd < MAX_FALL_AIR)
{
	vspd += GRAVITY_AIR;
}
else	vspd = MAX_FALL_AIR;

x += hspd * DELTA_TIME;
y += vspd * DELTA_TIME;