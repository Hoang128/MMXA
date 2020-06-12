/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_gameManager.playerCore))
{
	if (place_meeting(x, y, obj_gameManager.playerCore))
	{
		global.xSpawmLocation = (bbox_right + bbox_left) / 2;
		global.ySpawmLocation = bbox_bottom;
		global.airSpawm = false;
	}
}