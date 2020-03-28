/// @description Init
instance_create_depth(x, y, depth + 1, obj_cameraMan);

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
instance_create_depth(x, y, 0, obj_testInGameMenu);