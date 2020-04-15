/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (moveTime <= 0)
{
	if (trans == 0)
	{
		if (phase < maxPhase)
			phase ++;
		else
			phase = 1;
		trans = 1;
	}
}