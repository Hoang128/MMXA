if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + RESOLUTION_WIDTH, Y_VIEW + RESOLUTION_HEIGH, self, false, false))
{
	instance_destroy(argument0);
}