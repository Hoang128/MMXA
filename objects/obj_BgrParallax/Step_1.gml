/// @description Position
if customDepth==0{
    if bgrLayer!=noone{
        layer_x(bgrLayer, x_Pos + X_VIEW * bgrDepth/10);
        layer_y(bgrLayer, y_Pos + Y_VIEW * bgrDepth/10);
	}
}
else{
    if bgrLayer!=noone{
        layer_x(bgrLayer, X_VIEW - x_Off);
        layer_y(bgrLayer, Y_VIEW - y_Off);
	}
}