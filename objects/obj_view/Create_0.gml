/// @description Init
instance_create_depth(x, y, depth + 1, obj_cameraMan);
instance_create_depth(x, y, depth + 100, obj_HUD);
instance_create_depth(x, y, depth + 200, obj_globalEffManager);

if (!global.isStage)
{
	view_enabled = false;
	view_visible = false;
	instance_destroy();
}
view_enabled = true;
view_visible = true;

scr_InitCamera();

//Create UI support