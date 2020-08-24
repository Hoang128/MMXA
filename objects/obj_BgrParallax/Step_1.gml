/// @description Position
if customDepth==0{
    if bgrLayer!=noone{
        layer_x(bgrLayer, x_Pos + X_VIEW * bgrDepth/10);
        layer_y(bgrLayer, y_Pos + Y_VIEW * bgrDepth/10);
	}
}
else{
    if bgrLayer!=noone{
		if (x_spd == 0)
			layer_x(bgrLayer, X_VIEW - x_Off);
		else
		{
			if (x_Pos + x_spd * DELTA_TIME) < (x_Pos + sprite_width)
			{
				layer_x(bgrLayer, x_Pos + x_spd * DELTA_TIME);
				x_Pos += x_spd * DELTA_TIME;
			}
			else
			{
				layer_x(bgrLayer, x_Pos + x_spd * DELTA_TIME - sprite_width);
				x_Pos += x_spd * DELTA_TIME - sprite_width;
			}
		}
		if (y_spd == 0)
		{
			layer_y(bgrLayer, Y_VIEW - y_Off);
		}
		else
		{
			if (y_Pos + y_spd * DELTA_TIME) < (y_Pos + sprite_height)
			{
				layer_y(bgrLayer, y_Pos + y_spd * DELTA_TIME);
				y_Pos += y_spd * DELTA_TIME;
			}
			else
			{
				layer_y(bgrLayer, y_Pos + y_spd * DELTA_TIME - sprite_height);
				y_Pos += y_spd * DELTA_TIME - sprite_height;
			}
		}
	}
}