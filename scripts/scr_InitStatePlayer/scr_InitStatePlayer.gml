var weightPlayer = argument0;

switch weightPlayer
{
	case WeighType.MASSIVE: break;
	default:
	{
		//Default state
		weight = WeighType.MEDIUM;
		activateState = ActivateState.HALF_ACTIVATE;
		aState = ActionState.BEAMDOWN;
		vState = VerticalState.V_MOVE_DOWN;
		hState = HorizontalState.H_MOVE_NONE;
		atkState = AttackState.A_NONE;
	
		sprite_index = sprFlash;
		image_index = 0;
	}
	break;
}