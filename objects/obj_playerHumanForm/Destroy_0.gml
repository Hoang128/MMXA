/// @description Destroy Effect & Set Core

if (aState == ActionState.DYING)
{
	obj_gameManager.playerCore = noone;
	obj_gameManager.roomTrans = noone;
	
	if (weight < WeighType.MASSIVE)
	{
		instance_destroy(obj_playerHUD);
		lives--;
	}
}