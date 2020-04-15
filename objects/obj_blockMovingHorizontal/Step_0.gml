/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (trans == 1)
{
	if (phase == 1)
	{
		moveSpd = 1;
		moveDir = 0;
		moveTime = 100;
	}
	
	if (phase == 2)
	{
		moveSpd = 1;
		moveDir = 180;
		moveTime = 100;
	}
	
	trans = 0;
}