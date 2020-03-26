/// @description Draw with palette

scr_PalSwapSet(myPal, 1, false);

draw_self();

scr_PalSwapReset();

//Test
if (atkState == AttackState.A_NORMAL_ATTACK)
	draw_sprite(spr_playerHitBoxDuck, 0, x, y);