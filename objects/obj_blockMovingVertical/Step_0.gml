/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (trans == 1)
{
	if (phase == 1)
	{
		moveSpd = 1;
		moveDir = 90;
		moveTime = 100;
	}
	
	if (phase == 2)
	{
		moveSpd = 1;
		moveDir = 270;
		moveTime = 100;
	}
	
	trans = 0;
}