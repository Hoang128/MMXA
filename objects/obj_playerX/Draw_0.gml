/// @description Draw with palette

scr_PalSwapSet(myPal, 1, false);

draw_self();

scr_PalSwapReset();

//Test
event_inherited();