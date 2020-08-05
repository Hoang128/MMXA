/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (myPal != noone)
{
	scr_PalSwapSet(myPal, palNum, false);
}

event_inherited();
if (myPal != noone)
{
	scr_PalSwapReset();
}