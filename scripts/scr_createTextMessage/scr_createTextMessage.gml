if (argument_count==0) exit;
else
{
	var mess = instance_create_layer(0, 0, obj_gameManager.lUI, obj_menuMessageText);
	mess.bustShotImg = argument[0];
	mess.contextNumber = argument_count - 1;
	for (i = 1; i < argument_count; i++)
	{
		mess.lineContext[i - 1] = argument[i];
	}
	return mess;
}