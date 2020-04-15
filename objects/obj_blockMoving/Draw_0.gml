/// @description Draw

draw_self();
draw_sprite_ext(spr_blockMovingDir, 0, (bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, image_xscale, image_yscale, moveDir, c_white, 1);