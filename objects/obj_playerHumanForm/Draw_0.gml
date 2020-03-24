/// @description Draw self

draw_set_color(c_red);
if (dynamicBlock!=noone){
	
draw_line(x,bbox_top,dynamicBlock.x,dynamicBlock.y);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x, y, string(obj_playerHumanForm.dynamicBlock));
draw_set_color(c_white);

}