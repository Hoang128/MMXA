/// @description Change elem in real-time
x = X_VIEW + W_VIEW/2;
y = Y_VIEW + H_VIEW/2;

if (quake > 0) 
{
	camera_set_view_pos(view_camera, X_VIEW, Y_VIEW + random_range(-2,2));
	quake -= global.deltaTime;
}