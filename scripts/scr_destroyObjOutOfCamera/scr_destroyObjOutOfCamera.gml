var x_view = X_VIEW;
var y_view = Y_VIEW;
if (x_view < 0)
	x_view = 0;
if (y_view < 0)
	y_view = 0;

if (!collision_rectangle(x_view, y_view, x_view + W_VIEW, y_view + H_VIEW, argument0, false, false))
{
	instance_destroy(argument0);
}
