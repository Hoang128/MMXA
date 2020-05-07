/// @description Draw
if (palette != noone)
	scr_PalSwapSet(palette, paletteNumber, false);

draw_self();

if (palette != noone)
	scr_PalSwapReset();