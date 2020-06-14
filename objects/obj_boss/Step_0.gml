/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (init == false)
{
	scr_BGMSet(bgm, false);
	init = true;
}
else
{
	event_inherited();

	if (hp <= 0)	
	{
		scr_BGMStop();
		instance_destroy();
	}

	if (inviTime > 0)
	{
		if (blink > 0) blink -= DELTA_TIME;
		else blink = blinkMax;
		blinkTime -= DELTA_TIME;
	}
	else
	{
		blink = 0;
		blinkTime = 0;
	}
}