/// @description Draw

if (formCharge != 0)
{
	if (chargeLevel < 3)
		scr_PalSwapSet(spr_PalZChargeEff, 1, false);
	else
		scr_PalSwapSet(spr_PalZChargeEff, 2, false);
}
	
draw_self();

if (formCharge != 0)
	scr_PalSwapReset();