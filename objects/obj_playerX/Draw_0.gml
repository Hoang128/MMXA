/// @description Draw with palette

event_inherited();

scr_DrawPlayerSprite(obj_playerX);
if (gpu_get_blendmode() == bm_add)
	gpu_set_blendmode(bm_normal);
//Test
if (atkState == AttackState.A_NORMAL_ATTACK)
	draw_sprite(spr_playerHitBoxDuck, 0, x, y);