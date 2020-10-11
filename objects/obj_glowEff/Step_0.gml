/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_gameManager.playerCore))
{
	x = obj_gameManager.playerCore.x;
	y = obj_gameManager.playerCore.y;
}

if (inited < 1)	inited++;

if (collision_point(x, y, obj_darkZone, false, false))
{
	dark = (collision_point(x, y, obj_darkZone, false, false)).darkLevel;
}
else
	dark = global.glow;

if (inited == 1)
{
	if (abs(glow - dark) >= changeSpd)
		glow += changeSpd * sign (dark - glow);
	else	
		glow = dark;
}
else
	glow = dark;

glowRatio1 = 0.8 * glow;
glowRatio2 = 0.7 * glow;
glowRatio3 = 0.6 * glow;

if (glowRatio1 < 0) glowRatio1 = 0;
if (glowRatio2 < 0) glowRatio2 = 0;
if (glowRatio3 < 0) glowRatio3 = 0;