if (!collision_rectangle(X_VIEW, Y_VIEW, X_VIEW + W_VIEW, Y_VIEW + H_VIEW, self, false, false))
{
	instance_destroy(argument0);
}