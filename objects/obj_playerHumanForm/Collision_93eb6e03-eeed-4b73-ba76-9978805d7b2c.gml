/// @description Climb up

if (activateState == ActivateState.ACTIVATE)
{
	if (aState != ActionState.CLIMBING)
	{
		if (keyboard_check(global.keyUp) && !keyboard_check(global.keyDown))
		{
			if (abs(x - (other.bbox_right + other.bbox_left) / 2) < minDistanceToLadder)
			{
				sprite_index = sprClimb1;
				image_index = 0;
				
				x = (other.bbox_right + other.bbox_left) / 2;
				y -= 2;
				hspd = 0;
				vspd = 0;
				if (dashSpd > 0)
				{
					dashSpd = 0;
					dashTime = 0;
				}
				canAirDash = 1;
				isClimbing = 1;
				vState = VerticalState.V_MOVE_NONE;
				hState = HorizontalState.H_MOVE_NONE;
				aState = ActionState.CLIMBING;
			}
		}
	}
}