/// @description Insert description here
// You can write your code in this editor
if (myPalSprite != noone)
{
	scr_PalSwapSet(myPalSprite, pal, false);
}

if (sprite_index != noone)
	draw_self();
	
if (myPalSprite != noone)
{
   scr_PalSwapReset();
}