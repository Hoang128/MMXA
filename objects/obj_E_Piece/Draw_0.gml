/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (palette != noone)
	scr_PalSwapSet(palette, paletteNumber, false);

event_inherited();

if (palette != noone)
	scr_PalSwapReset();