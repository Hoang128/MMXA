/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_gameManager.playerCore))
{
	//if (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_gameManager.playerCore, false, false)
	//|| collision_rectangle(bbox_left, bbox_top, bbox_left - 1, bbox_bottom, obj_gameManager.playerCore, false, false))
	if (place_meeting(x, y, obj_gameManager.playerCore))
	{
		if (state = gateState.LOCKING)
		{
			obj_view.moveMode = 2;
			state = gateState.UNLOCKING;
		}
	}
	else
	{
		if (state == gateState.UNLOCKING)
		{
			obj_view.moveMode = 2;
			state = gateState.LOCKING;
		}
	}
}