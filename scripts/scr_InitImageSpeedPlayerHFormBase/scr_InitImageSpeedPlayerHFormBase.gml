switch argument0
{
	case obj_playerX:
	{
		#region
		switch sprite_index
		{
			case sprStand: image_speed = 0.1; break;
			case sprRunStart:
			case sprRun:
			case sprRunEnd: image_speed = 0.3; break;
			case sprLand: image_speed = 0.5; break;
			case sprDash1: image_speed = 0.5; break;
			case sprDash2: image_speed = 0.6; break;
			case sprDash3: image_speed = 0.4; break;
			case sprJump1:
			case sprJump3: image_speed = 0.2; break;
			case sprJump2: 
			case sprJump4: image_speed = 1; break;
			default: image_speed = 0.5; break;
		}
		image_speed *= global.deltaTime;
		#endregion
	}
	break;
}