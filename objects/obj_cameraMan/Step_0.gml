/// @description Follow the right object
// You can write your code in this editor
playerCore = obj_gameManager.playerCore;

switch state
{
	case CameraState.NORMAL: 
	{
		if (instance_exists(playerCore))
		{
			if (playerCore.activateState != ActivateState.DEACTIVATE)
			{
				x = playerCore.x;
				y = playerCore.y;
			}
		}
		break;
	}
	case CameraState.FAILURE:
	default:
	{
		//Don't do anything ?
		break;
	}
}