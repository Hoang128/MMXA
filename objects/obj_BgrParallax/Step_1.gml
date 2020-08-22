/// @description Position
if customDepth==0{
    var cam_x = x_Pos - camera_get_view_x(view_camera[0]) - camera_get_view_width(view_camera[0])/2;
    var cam_y = y_Pos - camera_get_view_y(view_camera[0]) - camera_get_view_height(view_camera[0])/2;
    if bgrLayer!=noone{
        layer_x(bgrLayer, x_Pos + ( - cam_x) * bgrDepth/8);
        layer_y(bgrLayer, y_Pos + ( - cam_y) * bgrDepth/8);
	}
}
else{
	x_Pos = camera_get_view_x(view_camera[0]);
    y_Pos = camera_get_view_y(view_camera[0]);
    if bgrLayer!=noone{
        layer_x(bgrLayer, x_Pos);
        layer_y(bgrLayer, y_Pos);
	}
}