/// @description Follow the right object
// You can write your code in this editor
switch state
{
	case CameraState.NORMAL: 
	{
		if (instance_exists(obj_player))
		{
			with(obj_player)
			{
				if (activateState != ActivateState.DEACTIVATE)
				{
					other.x = self.x;
					other.y = self.y;
				}
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