var context = argument0;
var textColorF = argument1;
var textColorB = argument2;
draw_set_color(textColorB);
draw_text(xPlace+1,yPlace+1,string_hash_to_newline(context));
draw_set_color(textColorF);
draw_text(xPlace,yPlace,string_hash_to_newline(context));
yPlace += lineSpace;