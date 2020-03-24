/// @description Draw sprite

if (topLadder)
{
	if (!solid)
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_green, image_alpha);
	else
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_blue, image_alpha);
}
else
	draw_self();