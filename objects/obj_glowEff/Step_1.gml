/// @description Redraw surface

if (!surface_exists(glowSurface))
{  // Make sure surface exists - if game loses focus, the surface can sometimes be lost.
    // If the surface gets lost, the following recreates it and redraws all the instances.
	instance_activate_all(); // Activate all the instances again just for 1 step so they can be redrawn to the surface.
	glowSurface = surface_create(camera_get_view_width(view_camera), camera_get_view_height(view_camera));
}