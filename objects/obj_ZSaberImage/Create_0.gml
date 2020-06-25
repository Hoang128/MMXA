/// @description Init

event_inherited();

setupState = true;
state = SaberState.SABER_NONE;
sprite_index = noone;

scr_PalSwapInitSystem(shd_pal_swapper);
myPalSprite = spr_PalZSaber;
pal = 0;

for(var i = 0; i <= 4; i++)
{
	if (global.zSaber[i] == ItemState.USING)
	{
		if (i != 0)
			pal = i - 1;
	}
}